import 'package:flutter/material.dart';

class CustomTextfieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  const CustomTextfieldWidget(
      {super.key,
      required this.labelText,
      required this.controller,
      required bool obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
