import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/auth_page.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Role")),
      backgroundColor: const Color(0xFFE6F0FA), // very light blue
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.stretch, 
          children: [
            const Text(
              "Select Your Role",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AuthPage(role: 'Parent')),
                );
              },
              child: const Text("I'm a Parent"),
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AuthPage(role: 'Staff')),
                );
              },
              child: const Text("I'm a Staff Member"),
            ),
            ],
        ),
      ),
    );
  }
}
