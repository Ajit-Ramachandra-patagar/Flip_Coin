import 'package:flutter/material.dart';

class CoinWidget extends StatelessWidget {
  final bool isAnimating;

  const CoinWidget({super.key, required this.isAnimating});

  @override
  Widget build(BuildContext context) {
    return AnimatedRotation(
      turns: isAnimating ? 4 : 0,
      duration: const Duration(milliseconds: 1500),
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.amber,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text(
            '₹',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
