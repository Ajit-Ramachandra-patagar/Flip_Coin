import 'package:flip_coin/ActionButtons.dart';
import 'package:flip_coin/ChoiceButton.dart';
import 'package:flip_coin/CoinWidget.dart';
import 'package:flip_coin/MyDrawer.dart';
import 'package:flutter/material.dart';

class CoinTossScreen extends StatefulWidget {
  const CoinTossScreen({super.key});

  @override
  State<CoinTossScreen> createState() => _CoinTossScreenState();
}

class _CoinTossScreenState extends State<CoinTossScreen> {
  String? userChoice;
  String? result;
  String? gameResult;
  bool isAnimating = false;

  void handleChoice(String choice) {
    setState(() {
      userChoice = choice;
      result = null;
      gameResult = null;
    });
  }

  void handleToss() {
    if (userChoice == null) return;

    setState(() {
      isAnimating = true;
      result = null;
      gameResult = null;
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      final tossResult =
          (DateTime.now().millisecondsSinceEpoch % 2 == 0) ? 'Head' : 'Tail';
      setState(() {
        result = tossResult;
        gameResult =
            tossResult == userChoice ? 'Yehh You Won!' : 'Oops You Lost';
        isAnimating = false;
      });
    });
  }

  void handleReset() {
    setState(() {
      userChoice = null;
      result = null;
      gameResult = null;
      isAnimating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flip Coin',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 240, 189, 6),
      ),
      drawer: MyDrawer(),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoinWidget(isAnimating: isAnimating),
                    const SizedBox(height: 20),
                    ChoiceButtons(
                      userChoice: userChoice,
                      onChoiceSelected: handleChoice,
                      isAnimating: isAnimating,
                    ),
                    if (userChoice != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('You have selected $userChoice'),
                      ),
                    ActionButtons(
                      onToss: handleToss,
                      onReset: handleReset,
                      isAnimating: isAnimating,
                      userChoice: userChoice,
                    ),
                    if (result != null) Text('Result: $result'),
                    if (gameResult != null)
                      Text(
                        gameResult!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: gameResult!.contains('Won')
                              ? Colors.green
                              : Colors.red,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
