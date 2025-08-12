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

  final List<String> _titles = [
    "STAFF DASHBOARD",
    "ADD ANNOUNCEMENT",
    "VACCINE STOCK",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 242, 243),
      drawer: StaffDrawer(
        email: widget.email,
        onItemSelected: (index) {
          setState(() => _selectedIndex = index);
          Navigator.pop(context); // Close the drawer
        },
      ),
      body: Column(
        children: [
          // Custom top bar (instead of AppBar)
          Container(
            height: 56,
            color: const Color.fromARGB(255, 6, 76, 146),
            child: Row(
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  _titles[_selectedIndex],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
          // Main content
          Expanded(child: _pages[_selectedIndex]),
        ],
      ),
    );
  }
}
