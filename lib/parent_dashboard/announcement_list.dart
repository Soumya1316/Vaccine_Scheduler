import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/announcements.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class AnnouncementListScreen extends StatelessWidget {
  final String email;

  const AnnouncementListScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      title: "Announcements",
      email: email,
      child: PageView.builder(
        itemCount: announcements.isEmpty ? 1 : announcements.length,
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (context, index) {
          if (announcements.isEmpty) {
            return const Center(
              child: Text("No announcements yet."),
            );
          }

          final a = announcements[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      a.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      a.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Posted on: ${a.date.day}/${a.date.month}/${a.date.year}",
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
