import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_context.dart';
import '../../embrapa_api/models.dart';
import '../risco.dart';
import 'components/crop_card.dart';

class CultureWidget extends StatelessWidget {
  const CultureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => FutureBuilder<List<Crop>>(
    future: Provider.of<AppContextData>(context).contextCrops,
    builder: (context, cropSnapshot) {
      if (cropSnapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (cropSnapshot.hasError) {
        return Text('Erro: ${cropSnapshot.error}');
      } else {
        return CropListBuilder(
          crops: cropSnapshot.data ?? [],
          soils: Provider.of<AppContextData>(context).contextSoils,
        );
      }
    },
  );
}


class CropListBuilder extends StatelessWidget {
  final List<Crop> crops;
  final Future<List<Soil>> soils;

  const CropListBuilder({
    Key? key,
    required this.crops,
    required this.soils
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: crops.length,
    itemBuilder: (context, index) => GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Risco(cultura: crops[index])))
      ,
      child: CropCard(imagePath: crops[index].imagePath, name: crops[index].nome, description: crops[index].type),
    )
  );
}
