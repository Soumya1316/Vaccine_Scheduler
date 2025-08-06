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
      color: const Color.fromARGB(255, 219, 232, 246),
      vaccines: [
        Vaccine(name: 'Flu Vaccine'),
        Vaccine(name: 'COVID-19 Booster'),
        Vaccine(name: 'Hepatitis B'),
      ],
    ),
    Year(
      year: 2025,
      color: const Color.fromARGB(255, 219, 232, 246),
      vaccines: [
        Vaccine(name: 'Tetanus Shot'),
        Vaccine(name: 'Polio'),
      ],
    ),
    Year(
      year: 2026,
      color:  const Color.fromARGB(255, 219, 232, 246),
      vaccines: [
        Vaccine(name: 'MMR (Measles, Mumps, Rubella)'),
        Vaccine(name: 'Varicella (Chickenpox)'),
      ],
    ),
  ];

  Color getYearColor(int year) {
    switch (year) {
      case 2024:
        return  const Color.fromARGB(255, 240, 242, 243);
      case 2025:
        return  const Color.fromARGB(255, 238, 241, 243);
      case 2026:
        return const Color.fromARGB(255, 242, 243, 245);
      default:
        return Colors.grey.shade100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      email: widget.email,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [  Color.fromARGB(255, 8, 99, 190),
              Color.fromARGB(255, 8, 181, 155)],
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
                        color: Color.fromARGB(255, 6, 76, 146),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Year ${year.year}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 5, 57, 110),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  ...year.vaccines.map((vaccine) {
                    return ListTile(
                      leading: Icon(
                        Icons.vaccines,
                        color: vaccine.completed ? const Color.fromARGB(255, 134, 137, 136) : const Color.fromARGB(255, 10, 144, 131),
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
                          color: vaccine.completed ? const Color.fromARGB(255, 10, 144, 131) : const Color.fromARGB(255, 134, 137, 136),
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
