import 'package:flutter/material.dart';

class StaffHome extends StatelessWidget {
  final String email;

  const StaffHome({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        /*title: const Text(
          'STAFF DASHBOARD',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 249, 249, 249),
          ),
        ),*/
        backgroundColor: const Color.fromARGB(255, 6, 76, 146),
        centerTitle: true,
        elevation: 4,
      ),*/
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

          // Decorative bubbles
          Positioned(
            top: 80,
            left: 50,
            child: _buildBubble(100, Colors.white.withOpacity(0.08)),
          ),
          Positioned(
            bottom: 120,
            right: 40,
            child: _buildBubble(150, Colors.white.withOpacity(0.06)),
          ),
          Positioned(
            top: 200,
            right: 90,
            child: _buildBubble(80, Colors.white.withOpacity(0.07)),
          ),
          Positioned(
            bottom: 50,
            left: 60,
            child: _buildBubble(120, Colors.white.withOpacity(0.05)),
          ),

          // Main content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  shadowColor: Colors.black.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 5, 35, 109),
                                Color.fromARGB(255, 5, 82, 76),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: const Icon(
                            Icons.vaccines,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'WELCOME TO THE STAFF DASHBOARD',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 57, 110),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          email,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 6, 76, 146),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'ACCESS STAFF DASHBOARD AND MAKE ANNOUNCEMENTS.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 29, 67, 108),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create bubbles
  Widget _buildBubble(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}
