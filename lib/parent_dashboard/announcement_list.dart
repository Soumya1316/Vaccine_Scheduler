import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/announcements.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class AnnouncementList extends StatelessWidget {
  final String email;

  const AnnouncementList({super.key, required this.email});

  Color _getCardColor(int index) {
    final colors = [
      const Color.fromARGB(255, 187, 226, 248),
      const Color.fromARGB(255, 158, 213, 250),
      const Color.fromARGB(255, 137, 250, 248),
      const Color.fromARGB(255, 117, 142, 244),
      const Color.fromARGB(255, 147, 226, 240),
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
            colors: [ Color.fromARGB(255, 8, 99, 190),
              Color.fromARGB(255, 8, 181, 155)],
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
                                    size: 40, color: Color.fromARGB(255, 6, 76, 146)),
                                const SizedBox(height: 16),
                                Text(
                                  a.title,
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 5, 57, 110),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  a.description,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 6, 76, 146),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Posted on: ${a.date.day}/${a.date.month}/${a.date.year}",
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 6, 76, 146),
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
