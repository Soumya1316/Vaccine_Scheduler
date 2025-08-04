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
      AddAnnouncement(),
      SdPage(email: widget.email),
    ];
  }

  final List<String> _titles = ["Home", "Announcements", "Staff Dashboard"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      drawer: StaffDrawer(
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
