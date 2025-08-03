import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class AppointmentScreen extends StatefulWidget {
  final String email;

const AppointmentScreen({super.key, required this.email});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
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
    if (vaccineController.text.isEmpty || selectedDate == null || selectedTime == null) {
      setState(() {
        message = "Please fill all fields.";
      });
      return;
    }

    setState(() {
      message =
          "Appointment for ${vaccineController.text} set on ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year} at ${selectedTime!.format(context)}.";
      vaccineController.clear();
      selectedDate = null;
      selectedTime = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      title: "Appointments",
      email: widget.email, 
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: vaccineController,
              decoration: const InputDecoration(
                labelText: "Vaccine Name",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _pickDate,
                    child: Text(selectedDate == null
                        ? "Pick Date"
                        : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _pickTime,
                    child: Text(selectedTime == null
                        ? "Pick Time"
                        : selectedTime!.format(context)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitAppointment,
              child: const Text("Submit Appointment"),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(color: Colors.teal, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
