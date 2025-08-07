import 'package:flutter/material.dart';

class StaffHome extends StatelessWidget {
  final String email;

  const StaffHome({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('STAFF DASHBOARD'),
        backgroundColor: Color.fromARGB(255, 5, 57, 110),
        centerTitle: true,
      ),
       body: Container(
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
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.vaccines,
                      size: 80,
                      color: Color(0xFF39559E),
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
                        color:  Color.fromARGB(255, 6, 76, 146),
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
    ),
    );
  }
}
