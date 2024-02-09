import 'package:flutter/material.dart';

import '../../../embrapa_api/models.dart';
import 'soil_info.dart';

class CropRiskList extends StatefulWidget {
  final List<Soil> soils;
  final Function updateSelectedSoil;

  const CropRiskList({
    Key? key,
    required this.soils,
    required this.updateSelectedSoil,
  }) : super(key: key);

  @override
  _CropRiskListState createState() => _CropRiskListState();
}

class _CropRiskListState extends State<CropRiskList> {
  int _selectedSoilId = -1;

  void _updateSelectedSoil(int soilId) {
    _selectedSoilId = soilId;
    widget.updateSelectedSoil(soilId);
  }

  @override
  Widget build(BuildContext context) => ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: widget.soils.length,
    itemBuilder: (BuildContext context, int index) => GestureDetector(
      onTap: () => _updateSelectedSoil(widget.soils[index].id),
      child: SoilInfo(soil: widget.soils[index], isSelected: widget.soils[index].id == _selectedSoilId),
    )
  );
}