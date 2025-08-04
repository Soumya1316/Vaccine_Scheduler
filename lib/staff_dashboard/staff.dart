import 'package:flutter/material.dart';

class Vaccine {
  String name;
  String doseInfo;
  int quantity;

  Vaccine({
    required this.name,
    required this.doseInfo,
    this.quantity = 0,
  });
}

class SdPage extends StatefulWidget {
  final String email;
  const SdPage({super.key, required this.email});

  @override
  State<SdPage> createState() => _SdPageState();
}

class _SdPageState extends State<SdPage> {
  List<Vaccine> vaccines = [
    Vaccine(name: "BCG", doseInfo: "Single Dose", quantity: 10),
    Vaccine(name: "Polio", doseInfo: "3 Doses", quantity: 5),
    Vaccine(name: "Hepatitis B", doseInfo: "3 Doses", quantity: 8),
  ];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _doseController = TextEditingController();

  void _addVaccine() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        vaccines.add(
          Vaccine(
            name: _nameController.text,
            doseInfo: _doseController.text,
            quantity: 0,
          ),
        );
      });
      _nameController.clear();
      _doseController.clear();
      Navigator.pop(context);
    }
  }

  void _showAddVaccineForm() {
    _nameController.clear();
    _doseController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("Create New Vaccine Entry",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: "Vaccine Name"),
                validator: (value) =>
                    value!.isEmpty ? "Enter vaccine name" : null,
              ),
              TextFormField(
                controller: _doseController,
                decoration: const InputDecoration(labelText: "Dose Info"),
                validator: (value) =>
                    value!.isEmpty ? "Enter dose info" : null,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addVaccine,
                child: const Text("Add Vaccine"),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVaccineCard(Vaccine vaccine, int index) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vaccine name + quantity controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  vaccine.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle,
                          color: Colors.red, size: 28),
                      onPressed: () {
                        setState(() {
                          if (vaccine.quantity > 0) vaccine.quantity--;
                        });
                      },
                    ),
                    Text(
                      "${vaccine.quantity}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle,
                          color: Colors.green, size: 28),
                      onPressed: () {
                        setState(() {
                          vaccine.quantity++;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "Doses required: ${vaccine.doseInfo}",
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "Welcome ${widget.email}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),
            const Text(
              "Welcome to Staff Dashboard",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("Create New Vaccine Entry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              onPressed: _showAddVaccineForm,
            ),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: vaccines.length,
                itemBuilder: (context, index) {
                  return _buildVaccineCard(vaccines[index], index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
