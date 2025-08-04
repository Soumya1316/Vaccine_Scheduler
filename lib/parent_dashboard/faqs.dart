import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart';

class FAQs extends StatelessWidget {
  final String email;

  const FAQs({super.key, required this.email});

  final List<Map<String, String>> faqs = const [
    {
      "question": "How do I book a vaccine appointment?",
      "answer": "Go to the 'Book Appointment' section in the app.",
      "icon": "📅"
    },
    {
      "question": "Can I reschedule my appointment?",
      "answer": "Yes, you can reschedule from the 'My Appointments' page.",
      "icon": "🔁"
    },
    {
      "question": "Do I need to bring ID proof?",
      "answer": "Yes, valid government ID is required.",
      "icon": "🆔"
    },
    {
      "question": "What if I miss my appointment?",
      "answer": "Contact the healthcare provider for instructions.",
      "icon": "📞"
    },
    {
      "question": "Are vaccines free?",
      "answer": "It depends on the provider and government policy.",
      "icon": "💉"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      title: "FAQs",
      email: email,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEAF6FF), Color(0xFFD6E4F0)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: PageView.builder(
          itemCount: faqs.length,
          controller: PageController(viewportFraction: 0.9),
          itemBuilder: (context, index) {
            final faq = faqs[index];
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
                        faq["icon"]!,
                        style: const TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 16),

                      // Question
                      Text(
                        faq["question"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2F4F6F),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Line graphic
                      Container(
                        height: 2,
                        width: 60,
                        color: Colors.blueAccent.withOpacity(0.5),
                      ),
                      const SizedBox(height: 16),

                      // Answer
                      Text(
                        faq["answer"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF4A4A4A),
                          height: 1.5,
                        ),
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
