import 'package:flip_coin/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BG BetX',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const CoinTossScreen(),
    );
  }
}
