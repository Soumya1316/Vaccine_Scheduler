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
      backgroundColor: Colors.transparent, // make drawer transparent
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 5, 55, 106),
              Color.fromARGB(255, 6, 123, 106),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            DrawerHeader(
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
                    leading: const Icon(Icons.home_outlined, color: Colors.white),
                    title: const Text('Staff Dashboard', style: TextStyle(color: Colors.white)),
                    onTap: () => onItemSelected(0),
                    horizontalTitleGap: 12,
                  ),
                  ListTile(
                    leading: const Icon(Icons.announcement_outlined, color: Colors.white),
                    title: const Text('Announcements', style: TextStyle(color: Colors.white)),
                    onTap: () => onItemSelected(1),
                    horizontalTitleGap: 12,
                  ),
                  ListTile(
                    leading: const Icon(Icons.admin_panel_settings_outlined, color: Colors.white),
                    title: const Text('Staff', style: TextStyle(color: Colors.white)),
                    onTap: () => onItemSelected(2),
                    horizontalTitleGap: 12,
                  ),
                  const Divider(color:  Color.fromARGB(255, 242, 243, 244), thickness: 1, height: 30),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.red),
                    title: const Text('Logout', style: TextStyle(color: Colors.white)),
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
      ),
    );
  }
}
