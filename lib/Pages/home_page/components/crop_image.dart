import 'package:flutter/material.dart';

class CropImage extends StatelessWidget {
  final String imagePath;

  const CropImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
    ),
  );
}
