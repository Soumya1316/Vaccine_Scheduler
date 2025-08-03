import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/back_to_home_wrapper.dart';

class ChildProfilePage extends StatefulWidget {
  final String email;

const ChildProfilePage({super.key, required this.email});


  @override
  State<ChildProfilePage> createState() => _ChildProfilePageState();
}

class _ChildProfilePageState extends State<ChildProfilePage> {
  final nameController = TextEditingController();
  DateTime? selectedDate;
  String? gender;
  File? _image;

  List<Map<String, TextEditingController>> vaccinationControllers = [];

  @override
  void initState() {
    super.initState();
    vaccinationControllers.add({
      'vaccine': TextEditingController(),
      'date': TextEditingController(),
    });
  }

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2020),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _addVaccinationRow() {
    setState(() {
      vaccinationControllers.add({
        'vaccine': TextEditingController(),
        'date': TextEditingController(),
      });
    });
  }

  void _removeVaccinationRow(int index) {
    setState(() {
      vaccinationControllers.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

    return BackToHomeWrapper(
      title: "Child Profile",
      email: widget.email, 
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Section
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Full Name", style: labelStyle),
                  TextField(controller: nameController),
                  const SizedBox(height: 10),
                  Text("Date of Birth", style: labelStyle),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: _pickDate,
                        child: const Text("Pick Date"),
                      ),
                      const SizedBox(width: 10),
                      if (selectedDate != null)
                        Text("${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text("Gender", style: labelStyle),
                  Row(
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      const Text('Male'),
                      Radio<String>(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value;
                          });
                        },
                      ),
                      const Text('Female'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text("Previous Vaccinations", style: labelStyle),
                  const SizedBox(height: 10),
                  Column(
                    children: List.generate(vaccinationControllers.length, (index) {
                      return Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: vaccinationControllers[index]['vaccine'],
                              decoration: InputDecoration(
                                labelText: 'Vaccine Name ${index + 1}',
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            flex: 2,
                            child: TextField(
                              controller: vaccinationControllers[index]['date'],
                              decoration: const InputDecoration(
                                labelText: 'Date (DD-MM-YYYY)',
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () => _removeVaccinationRow(index),
                          ),
                        ],
                      );
                    }),
                  ),
                  TextButton.icon(
                    onPressed: _addVaccinationRow,
                    icon: const Icon(Icons.add),
                    label: const Text("Add Vaccination"),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String name = nameController.text;
                      String dob = selectedDate != null
                          ? "${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}"
                          : "Not selected";
                      String selectedGender = gender ?? "Not selected";
                      String vaccinations = vaccinationControllers
                          .asMap()
                          .entries
                          .map((entry) {
                            var data = entry.value;
                            return "• ${data['vaccine']?.text ?? ''} - ${data['date']?.text ?? ''}";
                          })
                          .join("\n");

                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text("Child Profile Saved"),
                          content: Text(
                            "Name: $name\nDOB: $dob\nGender: $selectedGender\n\nVaccinations:\n$vaccinations",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text("OK"),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text("Save"),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 20),

            // Right Section (Image)
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: _image != null ? FileImage(_image!) : null,
                      child: _image == null
                          ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                          : null,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text("Tap to upload photo"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
