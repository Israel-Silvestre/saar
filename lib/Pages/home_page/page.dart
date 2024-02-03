import 'package:flutter/material.dart';

import 'components/crop_info_card.dart';
import 'constants.dart';

class PlantsInfoPage extends StatelessWidget {
  const PlantsInfoPage({super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: cropsInfo.length,
    prototypeItem: const CropInfoCard(title: 'foo', description: 'foo', imagePath: 'foo'),
    itemBuilder: (context, index) => CropInfoCard(
      title: cropsInfo[index].title,
      description: cropsInfo[index].description,
      imagePath: cropsInfo[index].imagePath,
    ),
  );
}
