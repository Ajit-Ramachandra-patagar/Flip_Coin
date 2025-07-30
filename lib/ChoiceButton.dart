import 'package:flutter/material.dart';

class ChoiceButtons extends StatelessWidget {
  final String? userChoice;
  final Function(String) onChoiceSelected;
  final bool isAnimating;

  const ChoiceButtons({
    super.key,
    required this.userChoice,
    required this.onChoiceSelected,
    required this.isAnimating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: isAnimating ? null : () => onChoiceSelected('Head'),
          style: ElevatedButton.styleFrom(
            backgroundColor: userChoice == 'Head'
                ? const Color.fromARGB(255, 2, 55, 98)
                : const Color.fromARGB(255, 2, 81, 118),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Set corner radius to 8
            ),
          ),
          child: const Text(
            'Head',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: isAnimating ? null : () => onChoiceSelected('Tail'),
          style: ElevatedButton.styleFrom(
            backgroundColor: userChoice == 'Tail'
                ? const Color.fromARGB(255, 124, 3, 146)
                : const Color.fromARGB(255, 98, 2, 115),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Set corner radius to 8
            ),
          ),
          child: const Text(
            'Tail',
            style: TextStyle(color: Colors.white), // Set text color to white
          ),
        ),
      ],
    );
  }
}
