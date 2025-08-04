import 'package:flutter/material.dart';

class StaffHome extends StatelessWidget {
  final String email;

  const StaffHome({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Staff Dashboard, $email!',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

