import 'package:flutter/material.dart';
import '../widgets/back_to_home_wrapper.dart'; 

class Vaccine {
  final String name;
  bool completed;

  Vaccine({
    required this.name,
    this.completed = false,
  });
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
        Vaccine(name: 'Measles, Mumps, Rubella (MMR)'),
        Vaccine(name: 'Varicella (Chickenpox)'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      title: "Vaccine Timeline",
      email: widget.email,
      child: ListView.builder(
        itemCount: vaccineData.length,
        itemBuilder: (context, index) {
          final year = vaccineData[index];
          return Card(
            margin: const EdgeInsets.all(10),
            child: ExpansionTile(
              title: Text(
                'Year ${year.year}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              children: year.vaccines.map((vaccine) {
                return CheckboxListTile(
                  title: Text(vaccine.name),
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
