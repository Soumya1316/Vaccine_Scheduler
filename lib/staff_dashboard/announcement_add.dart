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
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 8, 99, 190),
              Color.fromARGB(255, 8, 181, 155),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
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
                      Icon(Icons.announcement, color: Color.fromARGB(255, 247, 248, 249), size: 28),
                      SizedBox(width: 8),
                      Text(
                        "Add Announcement",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 57, 110),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Replaced Card with Container (no box, no shadow)
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    // Optional: you can add color here if you want a background
                    // color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          "Create a new announcement",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 5, 57, 110),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          controller: titleController,
                          decoration: InputDecoration(
                            labelText: "Title",
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 242, 243),
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
                            floatingLabelBehavior: FloatingLabelBehavior.never,
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 242, 243),
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
                            backgroundColor: const Color.fromARGB(255, 240, 242, 243),
                            foregroundColor: Color.fromARGB(255, 5, 57, 110),
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
                            color: message.contains('added') ? const Color.fromARGB(255, 8, 211, 15) : const Color.fromARGB(255, 231, 21, 6),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
