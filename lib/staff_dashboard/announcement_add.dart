import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/announcements.dart';


class AddAnnouncement extends StatefulWidget {
  const AddAnnouncement({super.key});
  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String message = '';

  void _addAnnouncement() {
    if (titleController.text.isEmpty || descriptionController.text.isEmpty) {
      setState(() {
        message = "Please fill all fields.";
      });
      return;
    }

    announcements.add(
      Announcements(
        title: titleController.text.trim(),
        description: descriptionController.text.trim(),
        date: DateTime.now(),
      ),
    );

    setState(() {
      message = "Announcement added!";
      titleController.clear();
      descriptionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Announcement")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Description"),
              maxLines: 3,
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addAnnouncement,
              child: Text("Submit"),
            ),
            SizedBox(height: 10),
            Text(message, style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
