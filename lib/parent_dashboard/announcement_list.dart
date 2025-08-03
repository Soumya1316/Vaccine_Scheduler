import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/announcements.dart';

class AnnouncementListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: announcements.isEmpty
          ? Center(child: Text("No announcements yet."))
          : ListView.builder(
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                final a = announcements[index];
                return Card(
                  child: ListTile(
                    title: Text(a.title),
                    subtitle: Text(
                      "${a.description}\nPosted on: ${a.date.day}/${a.date.month}/${a.date.year}",
                    ),
                  ),
                );
              },
            ),
    );
  }
}
