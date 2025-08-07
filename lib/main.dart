import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/role_selection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const VaccineScheduler());
}

class VaccineScheduler extends StatelessWidget {
  const VaccineScheduler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaccine Scheduler',
      debugShowCheckedModeBanner: false,
      home: const RoleSelection(),
    );
  }
}