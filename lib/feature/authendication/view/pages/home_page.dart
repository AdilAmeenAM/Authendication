import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authendication/feature/authendication/google_auth_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  String? getFirstLetterOfUserName() {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Check if display name is available (e.g., from Google login)
      String? displayName = user.displayName;
      if (displayName != null && displayName.isNotEmpty) {
        return displayName[0].toUpperCase();
      }

      // Fallback to email if display name is not available
      if (user.email != null) {
        String userName = user.email!.split('@')[0];
        return userName.isNotEmpty ? userName[0].toUpperCase() : null;
      }
    }

    return null; // User not signed in, or no display name/email
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    String? firstLetter = getFirstLetterOfUserName();
    String? photoURL = user?.photoURL; // Get profile image URL if available

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 150,
              backgroundColor: Colors.grey,
              backgroundImage: photoURL != null
                  ? NetworkImage(photoURL)
                  : null, // Display image if available
              child: photoURL == null // If no image, show first letter or "?"
                  ? Center(
                      child: Text(
                        firstLetter ?? "?",
                        style: const TextStyle(fontSize: 150),
                      ),
                    )
                  : null,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await GoogleAuthServices.signOut();
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text("Log out"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
