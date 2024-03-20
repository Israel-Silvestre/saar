import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/risk_result.dart';
import '../../embrapa_api/service.dart';

import '../../app_context.dart';
import '../../embrapa_api/models.dart';
import 'components/crop_risk_image.dart';
import 'components/crop_risk_list.dart';

class CropRisk extends StatefulWidget {
  final Crop crop;

  const CropRisk({super.key, required this.crop});

  @override
  _CropRiskState createState() => _CropRiskState();
}

class _CropRiskState extends State<CropRisk> {
  int selectedSoilId = 0;
  List<List<bool>> soilRiskResult = [];

  @override
  void initState() {
    super.initState();
  }

  void setSelectedSoil(int soilId) async {
    setState(() {
      selectedSoilId = soilId;
    });

    var soilRisks = await EmbrapAPI.fetchMunicipiosRiscos(2024, widget.crop.id, selectedSoilId, "60%");
    setState(() {
      soilRiskResult = soilRisks.firstWhere((municipio) => municipio.nome == "Alto do Rodrigues").viabilidades;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green,
      iconTheme: const IconThemeData(color: Colors.white),
      title: const Text('Risco Climático', style: TextStyle(color: Colors.white)),
    ),
    body: Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Expanded(flex: 1, child: CropRiskImage(cropImagePath: widget.crop.imagePath)),
          const SizedBox(height: 10),
          Expanded(flex: 2, child: CropRiskSoils(cropName: widget.crop.nome, updateSelectedSoil: setSelectedSoil)),
          Expanded(
            flex: 1,
            child: soilRiskResult.isNotEmpty ? RiskResult(soilRiskResult: soilRiskResult) : Container()
          )
        ],
      ),
    ),
  );
}

class CropRiskSoils extends StatelessWidget {
  final String cropName;
  final Function updateSelectedSoil;

  const CropRiskSoils({
    super.key,
    required this.cropName,
    required this.updateSelectedSoil,
  });

  TextStyle cropNameStyle() => const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    overflow: TextOverflow.ellipsis,
  );

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(padding: const EdgeInsets.only(left: 11), child: Text(cropName, style: cropNameStyle())),
      SizedBox(
        height: 225,
        child: FutureBuilder<List<Soil>>(
          future: Provider.of<AppContextData>(context).contextSoils,
          builder: (context, cropSnapshot) {
            if (cropSnapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (cropSnapshot.hasError) {
              return Text('Erro: ${cropSnapshot.error}');
            } else {
              return CropRiskList(soils: cropSnapshot.data ?? [], updateSelectedSoil: updateSelectedSoil);
            }
          },
        ),
      )
    ],
  );
}

