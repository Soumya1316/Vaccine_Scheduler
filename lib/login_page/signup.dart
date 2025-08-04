import 'package:flutter/material.dart';
import 'login.dart'; // to access fakeUserDB

class SignUp extends StatefulWidget {
  final String role;

  const SignUp({super.key, required this.role});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';

  void signUp() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (fakeUserDB.containsKey(email)) {
      setState(() {
        message = "User already exists!";
      });
    } else {
      fakeUserDB[email] = {
        'password': password,
        'role': widget.role.toLowerCase(),
      };
      setState(() {
        message = "Account created! You can now login.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: "Password"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: signUp,
              child: const Text("Create Account"),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(
                color: message.contains("already") ? Colors.red : Colors.green,
              ),
            ),
            if (message.contains("Account created"))
              TextButton(
                onPressed: () {
                 Navigator.push(
                      context,
                    MaterialPageRoute(
                      builder: (_) => LoginPage(role: widget.role),
                    ),
);
                },
                child: const Text("Now Login"),
              ),
          ],
        ),
      ),
    );
  }
}
