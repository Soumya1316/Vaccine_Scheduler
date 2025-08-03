import 'package:flutter/material.dart';

class ParentHomeLanding extends StatelessWidget {
  final String email;

  const ParentHomeLanding({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Welcome to the Parent Dashboard, $email!',
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

