import 'package:flutter/material.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/components/my_textfield.dart';
import 'package:sushi/extensions/size_on_context.dart';
import 'package:sushi/services/auth/auth_services.dart'; // Import your authentication service

class SignUp extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(
            height: context.height * 0.19,
          ),
          Icon(
            Icons.lock_open_rounded,
            size: 70,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          const SizedBox(height: 25),
          Text(
            "Let's create an account for you",
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
          const SizedBox(height: 25),
          MyTextField(
              controller: nameController,
              hintText: "Name",
              keyboardType: TextInputType.name,
              obscureText: false),
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
              hintText: "Password",
              obscureText: true),
          const SizedBox(height: 25),
          MyTextField(
              controller: confirmPasswordController,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              hintText: "Confirm Password",
              obscureText: true),
          const SizedBox(height: 25),
          MyButton(
            text: "Sign up",
            onTap: () {
              _signUp(context);
            },
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Login here",
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

  void _signUp(BuildContext context) async {
    if (passwordController.text == confirmPasswordController.text) {
      await AuthService().signUpWithEmailAndPassword(nameController.text,
          emailController.text, passwordController.text, context);
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }
}
