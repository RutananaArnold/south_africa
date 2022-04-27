import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:south_africa/components/rounded_button.dart';
import 'package:south_africa/components/rounded_input_field.dart';
import 'package:south_africa/components/rounded_password_field.dart';
import 'package:south_africa/model/user.dart';
import 'package:south_africa/palette.dart';
import 'package:south_africa/profile.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.white,
      body: SingleChildScrollView(
          child: Form(
        key: formkey,
        child: Column(
          children: [
            const SizedBox(height: 50.0),
            const Text(
              "South Africa",
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.8,
                  color: Colors.black),
            ),
            headerSection(),
            RoundedInputField(
              controller: emailController,
              hintText: "Your Username",
            ),
            RoundedPasswordField(
              controller: passwordController,
              hintText: 'Your password',
            ),
            loginButton(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: const Text(
                  "Forgot your password ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  //UI Components
  headerSection() {
    return const SizedBox(
      height: 200.0,
      child: Center(
        child: Icon(
          Icons.location_on_outlined,
          color: Colors.black,
          size: 150.0,
        ),
      ),
    );
  }

  //LogicTrigger
  loginButton() {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(kappSecondary),
            ),
          )
        : RoundedButton(
            text: "LOGIN",
            color: kappSecondary,
            press: () {
              if (formkey.currentState!.validate()) {
                setState(() {
                  _isLoading = true;
                });
                register(emailController.text, passwordController.text);
              }
            },
          );
  }

  //LOGIC
  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        "Access-Control_Allow_Origin": "*",
      };

  register(String email, pass) async {
    Map data = {'username': email, 'password': pass};
    var jsonResponse;

    var url = Uri.parse('https://bukkinterview.free.beeceptor.com');
    var response =
        await http.post(url, body: jsonEncode(data), headers: _setHeaders());
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        User userdetails = User.fromJson(jsonResponse);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) => Profile(
                userCredentials: userdetails,
              ),
            ),
            (Route<dynamic> route) => false);
      }
    } else {
      jsonResponse = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(jsonResponse),
        duration: const Duration(seconds: 3),
      ));
    }
  }
}
