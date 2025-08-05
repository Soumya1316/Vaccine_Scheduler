import 'package:flutter/material.dart';
import '../widgets/back_to_home_wrapper.dart';

class Vaccine {
  final String name;
  bool completed;

  Vaccine({required this.name, this.completed = false});
}

class Year {
  final int year;
  final List<Vaccine> vaccines;
  final Color color;

  Year({required this.year, required this.vaccines, required this.color});
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
      color: Colors.deepPurple.shade100,
      vaccines: [
        Vaccine(name: 'Flu Vaccine'),
        Vaccine(name: 'COVID-19 Booster'),
        Vaccine(name: 'Hepatitis B'),
      ],
    ),
    Year(
      year: 2025,
      color: Colors.blue.shade100,
      vaccines: [
        Vaccine(name: 'Tetanus Shot'),
        Vaccine(name: 'Polio'),
      ],
    ),
    Year(
      year: 2026,
      color: Colors.green.shade100,
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
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1A2A3A), Color(0xFF2F4F6F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: vaccineData.length,
          itemBuilder: (context, index) {
            final year = vaccineData[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: year.color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(77, 158, 158, 158),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month_rounded,
                        color: Colors.black87,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Year ${year.year}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A2A3A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  ...year.vaccines.map((vaccine) {
                    return ListTile(
                      leading: Icon(
                        Icons.vaccines,
                        color: vaccine.completed ? Colors.teal : Colors.grey,
                      ),
                      title: Text(
                        vaccine.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: vaccine.completed
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          vaccine.completed
                              ? Icons.check_circle
                              : Icons.cancel_outlined,
                          color: vaccine.completed ? Colors.teal : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            vaccine.completed = !vaccine.completed;
                          });
                        },
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
