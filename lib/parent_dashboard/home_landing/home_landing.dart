import 'package:flutter/material.dart';

class ParentHomeLanding extends StatelessWidget {
  final String email;

  const ParentHomeLanding({super.key, required this.email});

  // Helper method to build translucent bubble circles like in RoleSelection
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
    return Scaffold(
      body: Stack(
        children: [
          // Gradient background
          Container(
            width: double.infinity,
            height: double.infinity,
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

          // Main UI content on top
          SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.vaccines,
                      size: 100,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 30),

                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(255, 6, 76, 146),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Welcome to the Parent Dashboard!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 5, 57, 110),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            email,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}