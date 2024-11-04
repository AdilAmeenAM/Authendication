import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authendication/feature/authendication/view/pages/home_page.dart';
import 'package:firebase_authendication/main.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthServices {
  static final GoogleSignIn _googleSignIn = GoogleSignIn();
  static Future<void> signInWithGoogle() async {
    await signOut();
    final userDetails = await _googleSignIn.signIn();
    if (userDetails == null) {
      log("User  cancelled the login flow!");
    } else {
      log("User name:${userDetails.displayName}");
      final googleAuthDetails = await userDetails.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuthDetails.accessToken,
        idToken: googleAuthDetails.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    }

    MyApp.navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (context) => const HomePage()));
  }

  static Future<void> signOut() async {
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
  }
}
