// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_authendication/feature/authendication/view/pages/home_page.dart';
// import 'package:firebase_authendication/feature/authendication/view/widgets/auth_button_widget.dart';
// import 'package:firebase_authendication/feature/authendication/view/widgets/custom_textfield_widget.dart';
// import 'package:firebase_authendication/feature/authendication/view/widgets/google_login_button_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';

// class LoginPage extends HookWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final emailController = useTextEditingController();
//     final passwordController = useTextEditingController();
//     final FirebaseAuth auth = FirebaseAuth.instance;

//     Future<void> login() async {
//       try {
//         await auth.signInWithEmailAndPassword(
//           email: emailController.text,
//           password: passwordController.text,
//         );

//         print('User logged in successfully');
//       } catch (e) {
//         print('Error: $e');
//       }
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) {
//           return const HomePage();
//         },
//       ));
//     }

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               const Text(
//                 'Login',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 50),
//               CustomTextfieldWidget(
//                 controller: emailController,
//                 labelText: "Email",
//               ),
//               const SizedBox(height: 20),
//               CustomTextfieldWidget(
//                   controller: passwordController, labelText: "Password"),
//               const SizedBox(height: 80),
//               AuthButtonWidgets(
//                 buttonName: "Login",
//                 onPressed: login,
//               ),
//               const SizedBox(height: 20),
//               const Row(
//                 children: [
//                   Expanded(child: Divider(color: Colors.grey)),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Text('or', style: TextStyle(color: Colors.grey)),
//                   ),
//                   Expanded(child: Divider(color: Colors.grey)),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               const GoogleLoginButtonWidget(),
//               const SizedBox(height: 10),
//               Center(
//                 child: TextButton(
//                   onPressed: () {},
//                   child: const Text(
//                     "Don't have an account? Register",
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authendication/feature/authendication/view/pages/home_page.dart';
import 'package:firebase_authendication/feature/authendication/view/widgets/auth_button_widget.dart';
import 'package:firebase_authendication/feature/authendication/view/widgets/custom_textfield_widget.dart';
import 'package:firebase_authendication/feature/authendication/view/widgets/google_login_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final FirebaseAuth auth = FirebaseAuth.instance;

    // Show a Snackbar with a given message
    void showSnackbar(String message) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    }

    // Handle the login process
    Future<void> login() async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        showSnackbar('Email and password are required.');
        return;
      }

      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        showSnackbar('Logged in successfully!');

        // Navigate to the HomePage after successful login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } catch (e) {
        showSnackbar('Login failed: ${e.toString()}');
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
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              CustomTextfieldWidget(
                controller: emailController,
                labelText: "Email",
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextfieldWidget(
                controller: passwordController,
                labelText: "Password",
                obscureText: true,
              ),
              const SizedBox(height: 80),
              AuthButtonWidgets(
                buttonName: "Login",
                onPressed: login,
              ),
              const SizedBox(height: 20),
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: const Text(
                    "Don't have an account? Register",
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
