import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String hintText, labelText;
  final bool isPassword, isEmail;
  final TextEditingController controller;

  const BuildTextField(
      {Key? key,
      required this.hintText,
      required this.labelText,
      required this.isPassword,
      required this.isEmail,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 20.0, right: 20.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), border: Border.all()),
        child: TextField(
          controller: controller,
          obscureText: isPassword,
          keyboardType:
              isEmail ? TextInputType.emailAddress : TextInputType.text,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              labelText: labelText,
              border: InputBorder.none),
        ),
      ),
    );
  }
}
