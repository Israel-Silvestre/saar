import 'package:flutter/material.dart';

import 'crop_image.dart';
import 'crop_info.dart';

class CropCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;

  const CropCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.description,
  });

  BoxDecoration _boxStyle() => BoxDecoration(
    color: Colors.white,
    shape: BoxShape.rectangle,
    borderRadius: const BorderRadius.all(Radius.circular(10)),
    boxShadow: [BoxShadow(
      color: Colors.black.withOpacity(0.5),
      offset: const Offset(0, 4),
      blurRadius: 8,
    )],
  );

  @override
  Widget build(BuildContext context) => Container(
    height: 80,
    width: 300,
    decoration: _boxStyle(),
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Row(
      children: [
        Expanded(flex: 1, child: CropImage(imagePath: imagePath)),
        Expanded(flex: 6, child: CropTextInfo(name: name, description: description)),
      ],
    ),
  );
}