import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/announcement_list.dart';
import 'appointment_page/appointment.dart';
import 'package:vaccine_scheduler/parent_dashboard/child_profile/child_profile.dart';
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
  Appointments(email: widget.email),
  ChildProfile(email: widget.email),
  VaccineTimeline(email: widget.email),
  FAQs(email: widget.email),
  MoreAboutVaccines(email: widget.email),
  AnnouncementList(email: widget.email),
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
