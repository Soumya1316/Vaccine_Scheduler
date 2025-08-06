import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/pdashboard.dart';

class BackToHomeWrapper extends StatelessWidget {
  final Widget child;
  final String email;

  const BackToHomeWrapper({
    super.key,
    required this.child,
    required this.email,
  });

  void _goHome(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => ParentDashboard(email: email)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => _goHome(context),
              ),
            ),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }
}
