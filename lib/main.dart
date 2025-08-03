import 'package:flutter/material.dart';
import 'login_page/login.dart';
import 'login_page/signup.dart';

void main() {
  runApp(const VaccineScheduler());
}

class VaccineScheduler extends StatelessWidget {
  const VaccineScheduler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VACCINE SCHEDULER',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpScreen(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Signup'),
            ),
          ],
        ),
      ),
    );
  }
}
