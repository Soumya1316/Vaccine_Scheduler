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

  // Helper method to build translucent bubble circles
  Widget _buildBubble(double diameter) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String capitalizedRole =
        role[0].toUpperCase() + role.substring(1).toLowerCase();

    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 8, 99, 190),
                  Color.fromARGB(255, 8, 181, 155),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Bubbles positioned in the background
          Positioned(
            top: 50,
            left: 30,
            child: _buildBubble(60),
          ),
          Positioned(
            top: 150,
            right: 40,
            child: _buildBubble(100),
          ),
          Positioned(
            bottom: 120,
            left: 60,
            child: _buildBubble(80),
          ),
          Positioned(
            bottom: 50,
            right: 90,
            child: _buildBubble(50),
          ),

          // Main UI content over the bubbles
          SafeArea(
            child: Stack(
              children: [
                // Back button
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                // Centered Text
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$capitalizedRole Authentication",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 57, 110),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Welcome, $capitalizedRole!",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 5, 57, 110),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Bottom buttons
                Positioned(
                  bottom: 40,
                  left: 24,
                  right: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () => navigateToLogin(context),
                        icon: const Icon(Icons.login),
                        label: const Text("Sign In"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 6, 76, 146),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () => navigateToSignup(context),
                        icon: const Icon(Icons.app_registration),
                        label: const Text("Sign Up"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color.fromARGB(255, 6, 76, 146),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          textStyle: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
