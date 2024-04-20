import 'package:flutter/material.dart';
import 'package:sushi/core/user.dart';
import 'package:sushi/pages/home_page.dart';
import 'package:sushi/pages/login_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    if (UserData.uid != null) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
