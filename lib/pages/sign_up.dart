import 'package:flutter/material.dart';
import 'package:sushi/components/my_textfield.dart';
import 'package:sushi/components/my_button.dart';
import 'package:sushi/services/auth/auth_services.dart'; // Import your authentication service

class SignUp extends StatelessWidget {
  final void Function()? onTap;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  SignUp({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                "Let's create an account for you",
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
              MyTextField(controller: confirmPasswordController, hintText: "Confirm Password", obscureText: true),
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
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTap,
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
        ),
      ),
    );
  }

  void _signUp(BuildContext context) async {
    if (passwordController.text == confirmPasswordController.text) {
      try {
        // Call your signup method from the authentication service
        await AuthService().signUpWithEmailAndPassword(emailController.text, passwordController.text);
        
        // Show a success message or navigate to another page upon successful signup
        // For example:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => SuccessPage()),
        // );
        
        // For now, let's just show a success dialog
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Sign up successful!"),
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }
}
