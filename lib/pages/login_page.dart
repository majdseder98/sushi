import 'package:flutter/material.dart';
import 'package:sushi/components/my_textfield.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/pages/home_page.dart';
import 'package:sushi/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;

  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final _authService = AuthService();
    try {
      await _authService.signInWithEmailAndPassword(emailController.text, passwordController.text);
      // Navigate to HomePage after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_open_rounded,
                size: 70,
                color: Theme.of(context).colorScheme.onBackground,
              ),
              const SizedBox(height: 25),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              const SizedBox(height: 25),
              MyTextField(controller: emailController, hintText: "Email", obscureText: false),
              const SizedBox(height: 25),
              MyTextField(controller: passwordController, hintText: "Password", obscureText: true),
              const SizedBox(height: 25),
              MyButton(
                text: "Sign In",
                onTap: login,
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
