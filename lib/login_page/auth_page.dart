import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/login.dart';
import 'package:vaccine_scheduler/login_page/signup.dart';

class AuthPage extends StatelessWidget {
  final String role;

  const AuthPage({super.key, required this.role});

  void navigateToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage(role: role)),
    );
  }

  void navigateToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp(role: role)),
    );
  }

  IconData _getRoleIcon() {
    switch (role.toLowerCase()) {
      case "parent":
        return Icons.family_restroom;
      case "staff":
        return Icons.medical_services;
      default:
        return Icons.person;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F0F9),
      appBar: AppBar(
        title: Text('$role Authentication'),
        backgroundColor: const Color(0xFF2F4F6F),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Role icon header
                Column(
                  children: [
                    Icon(_getRoleIcon(), size: 60, color: Colors.teal),
                    const SizedBox(height: 10),
                    Text(
                      "Welcome, $role",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2F4F6F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Auth card with login/signup
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 8,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 24,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => navigateToLogin(context),
                          icon: const Icon(Icons.login),
                          label: const Text("Login"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton.icon(
                          onPressed: () => navigateToSignup(context),
                          icon: const Icon(Icons.app_registration),
                          label: const Text("Signup"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            minimumSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
