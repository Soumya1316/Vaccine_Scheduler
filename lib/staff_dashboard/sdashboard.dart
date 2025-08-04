import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/staff_dashboard/announcement_add.dart';
import 'package:vaccine_scheduler/staff_dashboard/staff.dart';
import 'package:vaccine_scheduler/staff_dashboard/staff_drawer.dart';
import 'package:vaccine_scheduler/staff_dashboard/staffhome.dart';

class StaffDashboard extends StatefulWidget {
  final String email;
  const StaffDashboard({super.key, required this.email});

  @override
  State<StaffDashboard> createState() => _StaffDashboardState();
}

class _StaffDashboardState extends State<StaffDashboard> {
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      StaffHome(email: widget.email),
      const AddAnnouncement(),
      SdPage(email: widget.email),
    ];
  }

  final List<String> _titles = ["Staff Home", "Add Announcement", "Vaccine Stock"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F6FA),
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.5,
          ),
        ),
        backgroundColor: const Color(0xFF2F4F6F),
        centerTitle: true,
        elevation: 2,
      ),
      drawer: StaffDrawer(
        email: widget.email,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
          Navigator.pop(context); // Close the drawer
        },
      ),
      body: _pages[_selectedIndex],
    );
  }
}
