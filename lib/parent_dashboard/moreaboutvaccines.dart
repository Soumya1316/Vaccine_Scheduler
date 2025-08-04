import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class MoreAboutVaccines extends StatelessWidget {
  final String email;

  const MoreAboutVaccines({super.key, required this.email});

  final List<Map<String, String>> vaccineInfo = const [
    {
      "text": "Vaccines train your immune system to recognize and fight specific diseases.",
      "icon": "🧠"
    },
    {
      "text": "Most vaccines contain weakened or killed germs to stimulate immunity.",
      "icon": "🦠"
    },
    {
      "text": "Common side effects: mild fever, soreness, and tiredness.",
      "icon": "🌡️"
    },
    {
      "text": "Vaccines are safe and tested extensively before public use.",
      "icon": "✅"
    },
    {
      "text": "Staying updated with vaccines helps protect you and your community.",
      "icon": "🛡️"
    },
    {
      "text": "Some vaccines need boosters for long-lasting protection.",
      "icon": "💉"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      title: "More About Vaccines",
      email: email,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE8F9F1), Color(0xFFD2F0DD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: PageView.builder(
          itemCount: vaccineInfo.length,
          controller: PageController(viewportFraction: 0.9),
          itemBuilder: (context, index) {
            final info = vaccineInfo[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 8,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon/emoji
                      Text(
                        info["icon"]!,
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 16),

                      // Info Text
                      Text(
                        info["text"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF334D3C),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Graphic Divider
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.teal.withValues(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
