import 'package:flutter/material.dart';

import 'Pages/start.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amigo Agricultor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const StartPage(),
    );
  }
}

void main() {
  runApp(const MyApp());
}
