import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/role_selection.dart';

class StaffDrawer extends StatelessWidget {
  final String email;
  final Function(int) onItemSelected;

  const StaffDrawer({
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
            title: const Text('Staff Dashboard'),
            onTap: () => onItemSelected(0),
          ),
          ListTile(
            leading: const Icon(Icons.announcement),
            title: const Text('Announcements'),
            onTap: () => onItemSelected(1),
          ),
          ListTile(
            leading: const Icon(Icons.admin_panel_settings),
            title: const Text('Staff '),
            onTap: () => onItemSelected(2),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const RoleSelection()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
