import 'package:flutter/material.dart';
import 'package:saar/Pages/home_page/components/crop_info_card.dart';

class PlantsInfoPage extends StatelessWidget {
  const PlantsInfoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: const [
        PlantInfoCard(
          imagePath: 'assets/Culturas/mandioca.png',
          title: 'Mandioca',
          description: 'Clima no Rio Grande do Norte tende a favorecer o plantio de mandioca nos meses de janeiro até março',
        ),
        PlantInfoCard(
          imagePath: 'assets/Culturas/batataDoce.png',
          title: 'Batata Doce',
          description: 'Batata Doce vem se mostrando muito eficaz quando falamos de colheita em períodos de seca, no Sul do Rio Grande do Norte, veja mais...',
        ),
      ],
    );
  }
}