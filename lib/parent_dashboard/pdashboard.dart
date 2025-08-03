import 'package:flutter/material.dart';
import 'appointment_page/appointment.dart';
import 'package:vaccine_scheduler/parent_dashboard/child_profile/child_profile.dart';
//import 'package:vaccine_scheduler/login_page/login.dart';
import 'package:vaccine_scheduler/parent_dashboard/moreaboutvaccines.dart';
import 'package:vaccine_scheduler/parent_dashboard/vaccine_timeline/timeline.dart';
import 'package:vaccine_scheduler/parent_dashboard/home_landing/home_landing.dart';
import 'package:vaccine_scheduler/parent_dashboard/faqs.dart';
import 'package:vaccine_scheduler/parent_dashboard/parent_drawer.dart';

class ParentDashboard extends StatefulWidget {
  final String email;
  const ParentDashboard({super.key, required this.email});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      ParentHomeLanding(email: widget.email), 
      AppointmentScreen(email: widget.email),
      ChildProfilePage(),
      VaccineTimeline(),
      FAQs(),
      MoreAboutVaccines(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parent Dashboard")),
      drawer: ParentDrawer(
        email: widget.email,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
          Navigator.pop(context);
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}
