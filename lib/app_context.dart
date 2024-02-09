import 'package:flutter/material.dart';

import 'embrapa_api/models.dart';
import 'embrapa_api/service.dart';

class AppContextData extends ChangeNotifier {
  late Future<List<Soil>> contextSoils;
  late Future<List<Crop>> contextCrops;
  late Future<List<dynamic>> contextAvailableYears;

  AppContextData() {
    _fetchInitialData();
  }

  Future<void> _fetchInitialData() async {
    contextSoils = EmbrapAPI.fetchSolos();
    contextCrops = EmbrapAPI.fetchCulturas();
    contextAvailableYears = EmbrapAPI.fetchAnosDisponiveis();

    await Future.wait([contextCrops, contextSoils, contextAvailableYears]);

    notifyListeners();
  }

}
