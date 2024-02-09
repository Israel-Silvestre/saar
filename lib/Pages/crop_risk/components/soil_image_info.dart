import 'package:flutter/material.dart';

class SoilImageInfo extends StatelessWidget {
  final String imagePath;

  const SoilImageInfo({
    super.key,
    required this.imagePath,
  });


  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
    )
  );
}
