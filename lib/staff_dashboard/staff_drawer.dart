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
      child: Column(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF2979FF), Color(0xFF1565C0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 32, color: Colors.blue),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Welcome,\n$email",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home_outlined, color: Colors.black87),
                  title: const Text('Staff Dashboard'),
                  onTap: () => onItemSelected(0),
                  horizontalTitleGap: 12,
                ),
                ListTile(
                  leading: const Icon(Icons.announcement_outlined, color: Colors.black87),
                  title: const Text('Announcements'),
                  onTap: () => onItemSelected(1),
                  horizontalTitleGap: 12,
                ),
                ListTile(
                  leading: const Icon(Icons.admin_panel_settings_outlined, color: Colors.black87),
                  title: const Text('Staff'),
                  onTap: () => onItemSelected(2),
                  horizontalTitleGap: 12,
                ),
                const Divider(thickness: 1, height: 30),
                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
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
          ),
        ],
      ),
    );
  }
}
