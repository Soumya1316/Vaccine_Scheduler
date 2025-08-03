import 'package:flutter/material.dart';
import 'appointment_page/appointment.dart';
import 'package:vaccine_scheduler/parent_dashboard/child_profile/child_profile.dart';
import 'package:vaccine_scheduler/login_page/login.dart';
import 'package:vaccine_scheduler/parent_dashboard/vaccine_timeline/timeline.dart';
import 'package:vaccine_scheduler/parent_dashboard/home_landing/home_landing.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class ParentDashboard extends StatefulWidget {
  final String email;
  const ParentDashboard({super.key, required this.email});

  @override
  State<ParentDashboard> createState() => _ParentDashboardState();
}

class _ParentDashboardState extends State<ParentDashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [];

@override
void initState() {
  super.initState();
  _pages.addAll([
    ParentHomeLanding(email: widget.email), // index 0

    BackToHomeWrapper(
      onBack: () {
        setState(() => _selectedIndex = 0);
      },
      child: AppointmentScreen(email: widget.email),
    ),

    BackToHomeWrapper(
      onBack: () {
        setState(() => _selectedIndex = 0);
      },
      child: ChildProfilePage(),
    ),

    BackToHomeWrapper(
      onBack: () {
        setState(() => _selectedIndex = 0);
      },
      child: VaccineTimeline(),
    ),
  ]);
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Parent Dashboard")),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Text(
                "Welcome, ${widget.email}",
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                setState(() => _selectedIndex = 0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Appointments'),
              onTap: () {
                setState(() => _selectedIndex = 1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.child_care),
              title: const Text('Child Profile'),
              onTap: () {
                setState(() => _selectedIndex = 2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.timeline),
              title: const Text('Vaccine Timeline'),
              onTap: () {
                setState(() => _selectedIndex = 3);
                Navigator.pop(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}


