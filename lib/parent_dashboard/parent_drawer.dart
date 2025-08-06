import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/role_selection.dart';

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
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color.fromARGB(255, 5, 55, 106),
              Color.fromARGB(255, 6, 123, 106),],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.account_circle, size: 64, color: Colors.white),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      "Welcome,\n$email",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white24, thickness: 0.4),

            _buildDrawerItem(Icons.home, 'Home', 0),
            _buildDrawerItem(Icons.calendar_month, 'Appointments', 1),
            _buildDrawerItem(Icons.child_care, 'Child Profile', 2),
            _buildDrawerItem(Icons.timeline, 'Vaccine Timeline', 3),
            _buildDrawerItem(Icons.help_outline, 'FAQs', 4),
            _buildDrawerItem(Icons.medical_information, 'More About Vaccines', 5),
            _buildDrawerItem(Icons.announcement, 'Announcements', 6),

            const Divider(color: Colors.white24, thickness: 0.4),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
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
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, int index) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      onTap: () => onItemSelected(index),
    );
  }
}
