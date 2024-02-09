import 'package:flutter/material.dart';

import '../../../embrapa_api/models.dart';
import 'soil_image_info.dart';
import 'soil_text_info.dart';

class SoilInfo extends StatelessWidget {
  final Soil soil;
  final bool isSelected;

  const SoilInfo({
    super.key,
    required this.soil,
    required this.isSelected,
  });

  BoxDecoration boxStyle() {

    return BoxDecoration(
      color: isSelected ? const Color.fromARGB(255, 150, 243, 153) : Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      boxShadow: const [BoxShadow(
        color: Colors.black,
        offset: Offset(0, 4),
        blurRadius: 8,
      )],
    );
  }

  @override
  Widget build(BuildContext context) => Container(
    height: 30,
    width: 200,
    margin: const EdgeInsets.all(10),
    decoration: boxStyle(),
    child: Column(
      children: [
        Expanded(flex: 1, child: SoilTextInfo(title: soil.title, subtitle: soil.subtitle)),
        Expanded(flex: 2, child: SoilImageInfo(imagePath: soil.imagePath))
      ],
    ),
  );
}