import 'package:flutter/material.dart';

class CropRiskImage extends StatelessWidget {
  final String cropImagePath;

  const CropRiskImage({
    super.key,
    required this.cropImagePath,
  });

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage(cropImagePath), fit: BoxFit.cover)
    ),
  );
}