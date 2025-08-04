import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/announcement_list.dart';
import 'appointment_page/appointment.dart';
import 'package:vaccine_scheduler/parent_dashboard/child_profile/child_profile.dart';
import 'package:vaccine_scheduler/parent_dashboard/moreaboutvaccines.dart';
import 'package:vaccine_scheduler/parent_dashboard/vaccine_timeline/timeline.dart';
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
      _buildWelcomeCard(), // Instead of separate file
      Appointments(email: widget.email),
      ChildProfile(email: widget.email),
      VaccineTimeline(email: widget.email),
      FAQs(email: widget.email),
      MoreAboutVaccines(email: widget.email),
      AnnouncementList(email: widget.email),
    ];
  }

  Widget _buildWelcomeCard() {
    return Container(
      color: const Color(0xFFE3F2FD), // Light blue background
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          width: double.infinity,
          constraints: const BoxConstraints(maxWidth: 350),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.family_restroom,
                size: 60,
                color: Color(0xFF39559e),
              ),
              const SizedBox(height: 16),
              const Text(
                "WELCOME TO THE PARENT DASHBOARD",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF39559e),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.email,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Access child profile, appointments, FAQs and more.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF5774ba),
        title: const Text(
          "Parent Dashboard",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      drawer: ParentDrawer(
        email: widget.email,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
          Navigator.pop(context);
        },
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
    );
  }
}

