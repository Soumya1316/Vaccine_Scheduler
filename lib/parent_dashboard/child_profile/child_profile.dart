import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../widgets/back_to_home_wrapper.dart';

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
    final labelStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    final boxDecoration = BoxDecoration(
      color: Colors.blue.shade50,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 6,
          offset: const Offset(2, 2),
        ),
      ],
    );

    return BackToHomeWrapper(
      title: "Child Profile",
      email: widget.email,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: boxDecoration,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    backgroundColor: Colors.grey.shade200,
                    child: _image == null
                        ? const Icon(Icons.camera_alt, size: 40, color: Colors.grey)
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(child: Text("Tap to upload child photo")),
              const SizedBox(height: 30),
              Text("Full Name", style: labelStyle),
              const SizedBox(height: 5),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter full name",
                ),
              ),
              const SizedBox(height: 20),
              Text("Date of Birth", style: labelStyle),
              const SizedBox(height: 5),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickDate,
                    icon: const Icon(Icons.calendar_today),
                    label: const Text("Pick Date"),
                  ),
                  const SizedBox(width: 10),
                  if (selectedDate != null)
                    Text(
                      "${selectedDate!.day.toString().padLeft(2, '0')}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.year}",
                      style: const TextStyle(fontSize: 16),
                    ),
                ],
              ),
              const SizedBox(height: 20),
              Text("Gender", style: labelStyle),
              Row(
                children: [
                  Radio<String>(
                    value: 'Male',
                    groupValue: gender,
                    onChanged: (value) => setState(() => gender = value),
                  ),
                  const Text('Male'),
                  Radio<String>(
                    value: 'Female',
                    groupValue: gender,
                    onChanged: (value) => setState(() => gender = value),
                  ),
                  const Text('Female'),
                ],
              ),
              const Divider(height: 30, thickness: 1),
              Text("Previous Vaccinations", style: labelStyle),
              const SizedBox(height: 10),
              ...List.generate(vaccinationControllers.length, (index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: TextField(
                            controller: vaccinationControllers[index]['vaccine'],
                            decoration: InputDecoration(
                              labelText: 'Vaccine Name ${index + 1}',
                              border: const OutlineInputBorder(),
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
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () => _removeVaccinationRow(index),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: _addVaccinationRow,
                  icon: const Icon(Icons.add),
                  label: const Text("Add Vaccination"),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
