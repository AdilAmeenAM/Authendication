import 'package:flutter/material.dart';

class AuthButtonWidgets extends StatelessWidget {
  final String buttonName;
  final void Function() onPressed;
  const AuthButtonWidgets(
      {super.key, required this.buttonName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.purple[700],
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonName,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
