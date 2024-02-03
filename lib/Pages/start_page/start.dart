import 'package:flutter/material.dart';

import 'components/start_page_button.dart';
import '../routing_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/background.png', fit: BoxFit.cover),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logo.png'),
              const SizedBox(height: 20),
              const StartPageButton(buttonText: 'Entrar', targetWidget: PageRouting()),
              const SizedBox(height: 20),
              const StartPageButton(buttonText: 'Tutorial', targetWidget: PageRouting()),
            ],
          ),
        ),
      ],
    ),
  );
}
