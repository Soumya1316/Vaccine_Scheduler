import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/login.dart';
import 'package:vaccine_scheduler/login_page/signup.dart';

class AuthPage extends StatelessWidget {
  final String role;

  const AuthPage({super.key, required this.role});

  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(role: role),
      ),
    );
  }

  void navigateToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUp(role: role),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => navigateToLogin(context),
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => navigateToSignup(context),
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
