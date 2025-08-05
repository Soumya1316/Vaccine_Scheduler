import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/announcements.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class AnnouncementList extends StatelessWidget {
  final String email;

  const AnnouncementList({super.key, required this.email});

  Color _getCardColor(int index) {
    final colors = [
      Colors.pink.shade100,
      Colors.orange.shade100,
      Colors.green.shade100,
      Colors.blue.shade100,
      Colors.purple.shade100,
    ];
    return colors[index % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A2A3A), Color(0xFF2F4F6F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: BackToHomeWrapper(
            title: "Announcements",
            email: email,
            child: announcements.isEmpty
                ? const Center(
                    child: Text(
                      "No announcements yet.",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                    ),
                  )
                : PageView.builder(
                    itemCount: announcements.length,
                    controller: PageController(viewportFraction: 0.85),
                    itemBuilder: (context, index) {
                      final a = announcements[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 8),
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: _getCardColor(index),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.announcement_rounded,
                                    size: 40, color: Colors.black87),
                                const SizedBox(height: 16),
                                Text(
                                  a.title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1A2A3A),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  a.description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Posted on: ${a.date.day}/${a.date.month}/${a.date.year}",
                                  style: const TextStyle(
                                    color: Colors.black54,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

