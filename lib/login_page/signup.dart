import 'package:flutter/material.dart';
import 'login.dart';

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
              // Back button in top-left corner
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

              // White rounded signup form container
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
                      // Centered title
                      const Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A2A3A),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Email field
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

                      // Password field
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

                      // Sign Up button
                      ElevatedButton(
                        onPressed: signUp,
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
                        child: const Text("Create Account"),
                      ),
                      const SizedBox(height: 12),

                      // Message
                      if (message.isNotEmpty)
                        Center(
                          child: Text(
                            message,
                            style: TextStyle(
                              color: message.contains("already") ? Colors.red : Colors.green,
                            ),
                          ),
                        ),

                      // Now Login button
                      if (message.contains("Account created"))
                        Center(
                          child: TextButton(
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
                        ),

                      const Spacer(),

                      // Bottom divider line
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
