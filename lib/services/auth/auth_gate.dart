import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sushi/pages/home_page.dart';
import 'package:sushi/services/auth/login_or_signup.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrSignup();
          }
        },
      ),
    );
  }
}
