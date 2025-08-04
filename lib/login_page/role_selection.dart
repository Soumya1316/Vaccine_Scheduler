import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/auth_page.dart';

class RoleSelection extends StatelessWidget {
  const RoleSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Your Role")),
     body: Center( 
  child: Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      mainAxisSize: MainAxisSize.min, 
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AuthPage(role: 'Parent')),
            );
          },
          child: const Text("I'm a Parent"),
        ),
        const SizedBox(height: 20),
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
),
    );
  }
}
