import 'package:firebase_authendication/feature/authendication/google_auth_services.dart';
import 'package:flutter/material.dart';

class GoogleLoginButtonWidget extends StatelessWidget {
  const GoogleLoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset(
        "assets/images/google.png",
        width: 20,
        height: 20,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[800],
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onPressed: () async {
        await GoogleAuthServices.signInWithGoogle();
      },
      label: const Text(
        'Login with Google',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
