import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:vaccine_scheduler/parent_dashboard/pdashboard.dart';
import 'package:vaccine_scheduler/staff_dashboard/sdashboard.dart';

Map<String, Map<String, String>> fakeUserDB = {};

class LoginPage extends StatefulWidget {
  final String role;
  const LoginPage({super.key, required this.role});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message = '';

  void login() {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (fakeUserDB.containsKey(email) &&
        fakeUserDB[email]!['password'] == password) {
      String role = fakeUserDB[email]!['role'] ?? 'Parent';

      if (role.toLowerCase() == 'parent') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => ParentDashboard(email: email)),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => StaffDashboard(email: email)),
        );
      }
    } else {
      setState(() {
        message = "Invalid email or password!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A2A3A),
              Color(0xFF2F4F6F),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        "Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Spacer(),

Expanded(
  flex: 3,
  child: Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A2A3A),
            ),
          ),
        ),
        const SizedBox(height: 20),

        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: emailController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: "Email",
            ),
          ),
        ),
        const SizedBox(height: 16),

        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: "Password",
            ),
          ),
        ),
        const SizedBox(height: 24),

        ElevatedButton(
          onPressed: login,
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A2A3A),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          child: const Text("Login"),
        ),
        const SizedBox(height: 12),

        Center(
          child: TextButton(
            child: const Text("Don't have an account? Sign up"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => SignUp(role: widget.role),
                ),
              );
            },
          ),
        ),

        if (message.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ),

        const SizedBox(height: 30),

        const Divider(
          thickness: 1,
          color: Colors.black12,
        )
      ],
    ),
  ),
),

            ],
          ),
        ),
      ),
    );
  }
}
