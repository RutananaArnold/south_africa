import 'package:flutter/material.dart';
import 'package:south_africa/components/rounded_button.dart';
import 'package:south_africa/model/user.dart';

class Profile extends StatefulWidget {
  final User userCredentials;
  const Profile({
    Key? key,
    required this.userCredentials,
  }) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 1),
            Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(widget.userCredentials.userImage),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: color.withOpacity(0.8), width: 4),
                color: color.withOpacity(0.4),
              ),
            ),
            Center(
              child: Text(
                widget.userCredentials.username,
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
            ),
            const Spacer(flex: 2),
            RoundedButton(text: "LOGOUT", press: () {}, color: Colors.red),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}
