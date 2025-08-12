import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class Appointments extends StatefulWidget {
  final String email;

  const Appointments({super.key, required this.email});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  final TextEditingController vaccineController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String message = "";

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 1)),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  Future<void> _pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => selectedTime = picked);
    }
  }

  void _submitAppointment() {
    if (vaccineController.text.isEmpty ||
        selectedDate == null ||
        selectedTime == null) {
      setState(() {
        message = "⚠️ Please fill all fields.";
      });
      return;
    }

    setState(() {
      message =
          "✅ Appointment for '${vaccineController.text}' set on ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year} at ${selectedTime!.format(context)}.";
      vaccineController.clear();
      selectedDate = null;
      selectedTime = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      email: widget.email,
      child: Container(
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
          child: Column(
            children: [
              const Spacer(),

              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Center(
                        child: Text(
                          "Appointments",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 5, 57, 110),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF1F1F1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: TextField(
                          controller: vaccineController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Vaccine Name",
                          ),
                        ),
                      ),

                      const Spacer(),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton.icon(
                            onPressed: _pickDate,
                            icon: const Icon(Icons.calendar_today),
                            label: Text(
                              selectedDate == null
                                  ? "Pick Date"
                                  : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 5, 60, 116),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: _pickTime,
                            icon: const Icon(Icons.access_time),
                            label: Text(
                              selectedTime == null
                                  ? "Pick Time"
                                  : selectedTime!.format(context),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 6, 76, 146),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton.icon(
                            onPressed: _submitAppointment,
                            icon: const Icon(Icons.check_circle),
                            label: const Text("Submit Appointment"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                10,
                                144,
                                131,
                              ),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      if (message.isNotEmpty)
                        Center(
                          child: Text(
                            message,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 10, 144, 131),
                              fontSize: 16,
                            ),
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
    );
  }
}
