import 'package:flutter/material.dart';
import 'package:south_africa/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final bool x;
  final VoidCallback? tap;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
    this.x = false,
    this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        validator: ((value) =>
            value!.isNotEmpty ? null : "This field is required"),
        controller: controller,
        textInputAction: TextInputAction.next,
        cursorColor: Colors.black,
        readOnly: x,
        onTap: tap,
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.black,
            ),
            hintText: hintText,
            border: InputBorder.none,
            hintStyle: const TextStyle(color: Colors.black)),
      ),
    );
  }
}
