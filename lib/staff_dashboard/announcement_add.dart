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
        message = "⚠️ Please fill all fields.";
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
      message = "✅ Announcement added!";
      titleController.clear();
      descriptionController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 46, 100, 200),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Custom clean header
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.announcement, color: Color.fromARGB(255, 125, 180, 235), size: 28),
                    SizedBox(width: 8),
                    Text(
                      "Add Announcement",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 86, 171, 255),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // White Card container
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 6,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Create a new announcement",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 0, 107, 215),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: "Title",
                            filled: true,
                            fillColor: const Color.fromARGB(255, 77, 148, 255),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        TextField(
                          controller: descriptionController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: "Description",
                            filled: true,
                            fillColor: const Color.fromARGB(255, 3, 82, 202),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        ElevatedButton.icon(
                          onPressed: _addAnnouncement,
                          icon: const Icon(Icons.send),
                          label: const Text("Submit"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 108, 213, 203),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: message.contains('added') ? Colors.green : Colors.red,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
