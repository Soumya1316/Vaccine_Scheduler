import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/login.dart';

class ParentDrawer extends StatelessWidget {
  final String email;
  final Function(int)? onItemSelected; 

  const ParentDrawer({super.key, required this.email, this.onItemSelected});

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
            onTap: () {
              onItemSelected?.call(0);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Appointments'),
            onTap: () {
              onItemSelected?.call(1);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.child_care),
            title: const Text('Child Profile'),
            onTap: () {
              onItemSelected?.call(2);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.timeline),
            title: const Text('Vaccine Timeline'),
            onTap: () {
              onItemSelected?.call(3);
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
    );
  }
}
