import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authendication/feature/authendication/view/pages/home_page.dart';
import 'package:firebase_authendication/feature/authendication/view/pages/welcom_screen_page.dart';
import 'package:firebase_authendication/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const WelcomScreenPage(),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
   static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Firebase Auth Demo',
      theme: ThemeData.dark(),
      home: const AuthCheck(),
    );
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if a user is currently logged in
    if (FirebaseAuth.instance.currentUser != null) {
      // print(FirebaseAuth
      //     .instance.currentUser?.uid); // Prints user ID if logged in
      return const HomePage(); // Go directly to HomePage if logged in
    } else {
      return const WelcomScreenPage(); // Go to LoginPage if no user is logged in
    }
  }
}
