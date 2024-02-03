import 'package:flutter/material.dart';

import 'crop_image.dart';
import 'crop_text_info.dart';

class CropInfoCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const CropInfoCard({
    super.key,
    required this.title,
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
    width: 100,
    height: 300,
    decoration: _boxStyle(),
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        Expanded(flex: 2, child: CropImage(imagePath: imagePath)),
        Expanded(flex: 1, child: CropTextInfo(title: title, description: description)),
      ],
    ),
  );
}
