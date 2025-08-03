import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/login.dart';
import 'package:vaccine_scheduler/parent_dashboard/announcement_list.dart';

class ParentDrawer extends StatelessWidget {
  final String email;
  final Function(int) onItemSelected;

  const ParentDrawer({
    super.key,
    required this.email,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: Text(
              "Welcome, $email",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Appointments'),
            onTap: () => onItemSelected(1),
          ),
          ListTile(
            leading: const Icon(Icons.child_care),
            title: const Text('Child Profile'),
            onTap: () => onItemSelected(2),
          ),
          ListTile(
            leading: const Icon(Icons.timeline),
            title: const Text('Vaccine Timeline'),
            onTap: () => onItemSelected(3),
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: const Text('FAQs'),
            onTap: () => onItemSelected(4),
          ),
          ListTile(
            leading: const Icon(Icons.medical_information),
            title: const Text('More About Vaccines'),
            onTap: () => onItemSelected(5),
          ),
          ListTile(
            leading: const Icon(Icons.announcement),
            title: const Text("Announcements"),
            onTap: () => onItemSelected(6),
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
    );
  }
}