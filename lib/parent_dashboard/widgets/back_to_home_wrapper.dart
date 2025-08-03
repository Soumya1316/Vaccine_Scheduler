import 'package:flutter/material.dart';

class BackToHomeWrapper extends StatelessWidget {
  final VoidCallback onBack;
  final Widget child;

  const BackToHomeWrapper({
    super.key,
    required this.onBack,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: onBack,
          ),
        ),
        Expanded(child: child),
      ],
    );
  }
}
