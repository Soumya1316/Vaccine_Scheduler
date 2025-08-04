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
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, color: Colors.blue),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Welcome,\n$email",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          _buildTile(Icons.home, 'Home', () => onItemSelected(0)),
          _buildTile(Icons.calendar_month, 'Appointments', () => onItemSelected(1)),
          _buildTile(Icons.child_care, 'Child Profile', () => onItemSelected(2)),
          _buildTile(Icons.timeline, 'Vaccine Timeline', () => onItemSelected(3)),
          _buildTile(Icons.help_outline, 'FAQs', () => onItemSelected(4)),
          _buildTile(Icons.medical_information, 'More About Vaccines', () => onItemSelected(5)),
          _buildTile(Icons.announcement, 'Announcements', () => onItemSelected(6)),
          const Spacer(),
          const Divider(),
          _buildTile(
            Icons.logout,
            'Logout',
            () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const RoleSelection()),
                (route) => false,
              );
            },
            iconColor: Colors.red,
            textColor: Colors.red,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildTile(IconData icon, String label, VoidCallback onTap,
      {Color iconColor = Colors.black87, Color textColor = Colors.black87}) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          color: textColor,
        ),
      ),
      onTap: onTap,
    );
  }
}

