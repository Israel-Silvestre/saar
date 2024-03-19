import 'package:flutter/material.dart';

class StartPageButton extends StatelessWidget {
  final String buttonText;
  final Widget targetWidget;

  const StartPageButton({super.key, required this.buttonText, required this.targetWidget});

  void _goToTargetPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => targetWidget));
  }

  ButtonStyle _buttonStyle() => ButtonStyle(
    fixedSize: MaterialStateProperty.all<Size>(const Size(153, 76)),
    backgroundColor: MaterialStateProperty.all(const Color(0xFF4D9A00)), // Verde menta
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
    elevation: MaterialStateProperty.all(2.0), // Sombreado leve
  );


  TextStyle _textStyle() => const TextStyle(fontSize: 20, color: Color.fromARGB(255, 248, 248, 248));

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: () {_goToTargetPage(context);},
    style: _buttonStyle(),
    child: Text(buttonText, style: _textStyle(),),
  );
}
