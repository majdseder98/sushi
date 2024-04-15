import 'package:flutter/material.dart';
import 'package:sushi/pages/login_page.dart';
import 'package:sushi/pages/sign_up.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({Key? key}) : super(key: key);

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  bool showLoginPage = true;

  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglePages, // Pass togglePages function to LoginPage
      );
    } else {
      return SignUp(
        onTap: togglePages, // Pass togglePages function to SignUp
      );
    }
  }
}
