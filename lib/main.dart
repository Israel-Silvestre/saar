import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/start_page/start.dart';
import 'app_context.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => AppContextData(),
    child: MaterialApp(
      home: const StartPage(),
      title: 'Amigo Agricultor',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.green), useMaterial3: true),
    ),
  ));
}
