import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
class Start extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Padding(
              padding: EdgeInsets.all(50.0),
              child: Column(
                children: [
                  Image(image: AssetImage('assets/logo.png')),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}