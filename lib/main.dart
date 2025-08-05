
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vaccine_scheduler/firebase_options.dart';
import 'login_page/login.dart';
import 'package:vaccine_scheduler/login_page/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 66, 191, 245),
                  Color.fromARGB(255, 15, 20, 186),
                ],
              ),
            ),
          ),

          // Decorative circles
          Positioned(
            top: -40,
            left: -30,
            child: _decorativeCircle(120),
          ),
          Positioned(
            bottom: -50,
            right: -40,
            child: _decorativeCircle(150),
          ),

          // Foreground card
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.vaccines_rounded, size: 80, color: Color.fromARGB(255, 15, 20, 186)),
                  const SizedBox(height: 20),
                  const Text(
                    'Welcome to Vaccine Scheduler',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 15, 20, 186),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage(role: 'parent')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 66, 191, 245),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Login as Parent'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginPage(role: 'staff')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 15, 20, 186),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Login as Staff'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for decorative background circles
  Widget _decorativeCircle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white24,
      ),
    );
  }
}
