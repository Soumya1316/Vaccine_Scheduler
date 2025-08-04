import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/role_selection.dart';

void main() {
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
