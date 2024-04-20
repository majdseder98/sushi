import 'package:flutter/material.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/components/my_textfield.dart';
import 'package:sushi/extensions/size_on_context.dart';
import 'package:sushi/pages/sign_up.dart';
import 'package:sushi/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() async {
    final authService = AuthService();
    await authService.signInWithEmailAndPassword(
        emailController.text, passwordController.text, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: context.height * 0.12,
          ),
          Icon(
            Icons.lock_open_rounded,
            size: 70,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Welcome",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
          ),
          const SizedBox(height: 25),
          MyTextField(
              controller: emailController,
              hintText: "Email",
              keyboardType: TextInputType.emailAddress,
              obscureText: false),
          const SizedBox(height: 25),
          MyTextField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              hintText: "Password",
              obscureText: true),
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
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SignUp(),
                  ));
                },
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
    );
  }
}
