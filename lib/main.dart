import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/login_page/role_selection.dart';

void main() {
  runApp(const VaccineScheduler());
}

class VaccineScheduler extends StatelessWidget {
  const VaccineScheduler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaccine Scheduler',
      debugShowCheckedModeBanner: false,
      home: const RoleSelection(),
    );
  }
}

class Vaccine {
  final String name;
  bool completed;

  Vaccine({required this.name, this.completed = false});
}

class Year {
  final int year;
  final List<Vaccine> vaccines;

  Year({required this.year, required this.vaccines});
}

class VaccineTimeline extends StatefulWidget {
  final String email;

  const VaccineTimeline({super.key, required this.email});

  @override
  State<VaccineTimeline> createState() => _VaccineTimelineState();
}

class _VaccineTimelineState extends State<VaccineTimeline> {
  List<Year> vaccineData = [
    Year(
      year: 2024,
      vaccines: [
        Vaccine(name: 'Flu Vaccine'),
        Vaccine(name: 'COVID-19 Booster'),
        Vaccine(name: 'Hepatitis B'),
      ],
    ),
    Year(
      year: 2025,
      vaccines: [
        Vaccine(name: 'Tetanus Shot'),
        Vaccine(name: 'Polio'),
      ],
    ),
    Year(
      year: 2026,
      vaccines: [
        Vaccine(name: 'MMR (Measles, Mumps, Rubella)'),
        Vaccine(name: 'Varicella (Chickenpox)'),
      ],
    ),
  ];

  Color getYearColor(int year) {
    switch (year) {
      case 2024:
        return Colors.blue.shade50;
      case 2025:
        return Colors.green.shade50;
      case 2026:
        return Colors.purple.shade50;
      default:
        return Colors.grey.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vaccine Timeline'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: vaccineData.length,
        itemBuilder: (context, index) {
          final year = vaccineData[index];
          int completed = year.vaccines.where((v) => v.completed).length;
          int total = year.vaccines.length;
          double progress = total == 0 ? 0 : completed / total;

          return Card(
            margin: const EdgeInsets.all(12),
            color: getYearColor(year.year),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            child: ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              title: Text(
                'Year ${year.year}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.teal,
                  minHeight: 6,
                ),
              ),
              children: year.vaccines.map((vaccine) {
                return CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Row(
                    children: [
                      const Icon(Icons.vaccines, color: Colors.teal),
                      const SizedBox(width: 10),
                      Expanded(child: Text(vaccine.name)),
                    ],
                  ),
                  value: vaccine.completed,
                  onChanged: (bool? newValue) {
                    setState(() {
                      vaccine.completed = newValue ?? false;
                    });
                  },
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
