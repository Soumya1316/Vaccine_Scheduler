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
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
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
              const Text(
                "Create New Vaccine Entry",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Vaccine Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter vaccine name" : null,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _doseController,
                decoration: InputDecoration(
                  labelText: "Dose Info",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter dose info" : null,
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _addVaccine,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Add Vaccine",
                  style: TextStyle(fontSize: 16),
                ),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  vaccine.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2F4F6F),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline,
                          color: Colors.red, size: 26),
                      onPressed: () {
                        setState(() {
                          if (vaccine.quantity > 0) vaccine.quantity--;
                        });
                      },
                    ),
                    Text(
                      "${vaccine.quantity}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline,
                          color: Colors.green, size: 26),
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
      backgroundColor: const Color(0xFFF1F6FA),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Text(
              "Welcome ${widget.email}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Staff Vaccine Dashboard",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2F4F6F),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              icon: const Icon(Icons.add, size: 20),
              label: const Text("Create New Vaccine Entry"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[600],
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: _showAddVaccineForm,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: ListView.builder(
                  itemCount: vaccines.length,
                  itemBuilder: (context, index) {
                    return _buildVaccineCard(vaccines[index], index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
