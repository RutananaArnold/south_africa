import 'package:flutter/material.dart';
import 'package:south_africa/palette.dart';
import 'package:south_africa/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  const RoundedPasswordField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() {
    return RoundedPasswordFieldState();
  }
}

class RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool passHide = true;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: widget.controller,
        obscureText: passHide ? true : false,
        validator: ((value) =>
            value!.isNotEmpty ? null : "This field is required"),
        cursorColor: kPrimaryColor,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          hintText: widget.hintText,
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            /**Icons.visibility */
            color: kPrimaryColor,
            icon: Icon(
                passHide ? Icons.visibility : Icons.visibility_off_rounded),
            onPressed: () {
              setState(() {
                passHide = !passHide;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
