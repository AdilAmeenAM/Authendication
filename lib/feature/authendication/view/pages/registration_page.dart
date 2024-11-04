import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authendication/feature/authendication/view/pages/home_page.dart';
import 'package:firebase_authendication/feature/authendication/view/widgets/auth_button_widget.dart';
import 'package:firebase_authendication/feature/authendication/view/widgets/custom_textfield_widget.dart';
import 'package:firebase_authendication/feature/authendication/view/widgets/google_login_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegistrationPage extends HookWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final auth = FirebaseAuth.instance;

    void showMessage(BuildContext context, String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    Future<void> registration() async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final confirmPassword = confirmPasswordController.text.trim();
      if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
        showMessage(context, "All field are required");
        return;
      }
      if (password != confirmPassword) {
        showMessage(context, "Password do not match");
      }
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        showMessage(context, "Registration successfull");
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) {
            return const HomePage();
          },
        ));
      } catch (e) {
        showMessage(context, "Error: ${e.toString()}");
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Registor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              CustomTextfieldWidget(
                obscureText: false,
                controller: emailController,
                labelText: "Email",
              ),
              const SizedBox(height: 20),
              CustomTextfieldWidget(
                  obscureText: true,
                  controller: passwordController,
                  labelText: "Password"),
              const SizedBox(height: 20),
              CustomTextfieldWidget(
                  obscureText: true,
                  controller: confirmPasswordController,
                  labelText: "Conform Password"),
              const SizedBox(height: 80),
              AuthButtonWidgets(
                buttonName: "Registor",
                onPressed: registration,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('or', style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20),
              const GoogleLoginButtonWidget(),
              const SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Alredy have a accound? Login",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
