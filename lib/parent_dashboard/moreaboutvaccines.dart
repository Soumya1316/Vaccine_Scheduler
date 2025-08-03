import 'package:flutter/material.dart';

class MoreAboutVaccines extends StatelessWidget {
  const MoreAboutVaccines({super.key});

  final List<String> vaccineInfo = const [
    "Vaccines work by training your immune system to recognize and fight specific diseases.",
    "Most vaccines contain a weakened or killed form of the germ, or pieces of it, to stimulate immunity.",
    "Common side effects include mild fever, soreness at the injection site, and tiredness.",
    "Vaccines have been proven safe through extensive testing before public use.",
    "Staying up to date with vaccines helps protect both you and your community.",
    "Some vaccines require booster doses for long-lasting protection."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "More About Vaccines",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: PageView.builder(
        itemCount: vaccineInfo.length,
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              elevation: 6,
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    vaccineInfo[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
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
