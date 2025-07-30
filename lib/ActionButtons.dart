import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  final VoidCallback onToss;
  final VoidCallback onReset;
  final bool isAnimating;
  final String? userChoice;

  const ActionButtons({
    super.key,
    required this.onToss,
    required this.onReset,
    required this.isAnimating,
    required this.userChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SizedBox(
            width: 200, // Controls button width
            child: ElevatedButton(
              onPressed: isAnimating || userChoice == null ? null : onToss,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8), // Reduced corner radius
                ),
              ),
              child: const Text(
                'Toss',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200, // Adjust this width to make it smaller
                child: ElevatedButton(
                  onPressed: onReset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Reduced corner radius
                    ),
                  ),
                  child: const Text(
                    'Reset',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
