import 'package:flutter/material.dart';

class StartPageButton extends StatelessWidget {
  final String buttonText;
  final Widget targetWidget;

  const StartPageButton({super.key, required this.buttonText, required this.targetWidget});

  void _goToTargetPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => targetWidget));
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(15)),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: TextButton(
      onPressed: () {_goToTargetPage(context);},
      child: Text(
        buttonText,
        style: const TextStyle(fontSize: 20, color: Colors.white)
      ),
    ),
  );
}
