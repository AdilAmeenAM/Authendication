import 'package:firebase_authendication/feature/authendication/view/pages/login_page.dart';
import 'package:firebase_authendication/feature/authendication/view/pages/registration_page.dart';
import 'package:firebase_authendication/feature/authendication/view/widgets/auth_button_widget.dart';
import 'package:flutter/material.dart';

class WelcomScreenPage extends StatelessWidget {
  const WelcomScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Add navigation logic if needed
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 30),
            const Text(
              'Welcome to UpTodo',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Please login to your account or create new account to continue',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 200),
            AuthButtonWidgets(
              buttonName: "login",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const LoginPage();
                  },
                ));
              },
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return const RegistrationPage();
                  },
                ));
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.purple[700]!, width: 2),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'CREATE ACCOUNT',
                style: TextStyle(
                  color: Colors.purple[700],
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
