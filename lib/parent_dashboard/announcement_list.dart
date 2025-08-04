import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/announcements.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class AnnouncementList extends StatelessWidget {
  final String email;

  const AnnouncementList({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      title: "Announcements",
      email: email,
      child: Container(
        color: const Color(0xFFF4F6FA), // subtle background
        child: PageView.builder(
          itemCount: announcements.isEmpty ? 1 : announcements.length,
          controller: PageController(viewportFraction: 0.9),
          itemBuilder: (context, index) {
            if (announcements.isEmpty) {
              return const Center(
                child: Text(
                  "No announcements yet.",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              );
            }

            final a = announcements[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 4),
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(20),
                shadowColor: Colors.black26,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFF819ee5), Color(0xFF5774ba)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.campaign_rounded,
                          size: 48,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          a.title,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          a.description,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "📅 ${a.date.day}/${a.date.month}/${a.date.year}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white60,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

