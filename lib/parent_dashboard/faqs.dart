import 'package:flutter/material.dart';
import 'package:vaccine_scheduler/parent_dashboard/widgets/back_to_home_wrapper.dart'; // Adjust the path if needed

class FAQs extends StatelessWidget {
  final String email;

const FAQs({super.key, required this.email});


  final List<String> faqs = const [
    "Q1: How do I book a vaccine appointment?\nA: Go to the 'Book Appointment' section in the app.",
    "Q2: Can I reschedule my appointment?\nA: Yes, you can reschedule from the 'My Appointments' page.",
    "Q3: Do I need to bring ID proof?\nA: Yes, valid government ID is required.",
    "Q4: What should I do if I miss my appointment?\nA: Contact the healthcare provider for further instructions.",
    "Q5: Are vaccines free?\nA: It depends on the healthcare provider and government policy."
  ];

  @override
  Widget build(BuildContext context) {
    return BackToHomeWrapper(
      title: "FAQs",
      email: email, 
      child: PageView.builder(
        itemCount: faqs.length,
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 6,
              color: const Color.fromARGB(255, 26, 9, 99),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    faqs[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
