import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ChildProfile extends StatefulWidget {
  final String email;
  const ChildProfile({super.key, required this.email});

  @override
  State<ChildProfile> createState() => _ChildProfileState();
}

class _ChildProfileState extends State<ChildProfile> {
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
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
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
    final labelStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A2A3A), Color(0xFF2F4F6F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              // Top bar
              Positioned(
                top: 10,
                left: 10,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Back",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).size.height * 0.25,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                    Text(
                                        "${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}"),
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
                                children: List.generate(
                                    vaccinationControllers.length, (index) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: TextField(
                                          controller:
                                              vaccinationControllers[index]
                                                  ['vaccine'],
                                          decoration: InputDecoration(
                                            labelText:
                                                'Vaccine Name ${index + 1}',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        flex: 2,
                                        child: TextField(
                                          controller:
                                              vaccinationControllers[index]
                                                  ['date'],
                                          decoration: const InputDecoration(
                                            labelText: 'Date (DD-MM-YYYY)',
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.remove_circle,
                                            color: Colors.red),
                                        onPressed: () =>
                                            _removeVaccinationRow(index),
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
                                  String selectedGender =
                                      gender ?? "Not selected";
                                  String vaccinations =
                                      vaccinationControllers
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
                                          onPressed: () =>
                                              Navigator.pop(context),
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

                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: _pickImage,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: _image != null
                                      ? FileImage(_image!)
                                      : null,
                                  child: _image == null
                                      ? const Icon(Icons.camera_alt,
                                          size: 40, color: Colors.grey)
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
