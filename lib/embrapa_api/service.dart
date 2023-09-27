import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:saar/embrapa_api/models.dart';

// TODO fazer documentar codigo e fazer testes

class EmbrapAPI {

  static const String soloUri = "https://meteorologia.emparn.rn.gov.br/api/solo";
  static const String culturasUri = "https://meteorologia.emparn.rn.gov.br/api/culturas";
  static const String anosUri = "https://meteorologia.emparn.rn.gov.br/api/riscos-agricolas/anos-disponiveis";

  static Future<List<Municipio>> fetchMunicipiosRiscos(int ano, int idCultura, int idSolo, String porcentagem) async {
    final Response response = await http.get(Uri.parse(
      "https://meteorologia.emparn.rn.gov.br/api/riscos-agricolas/exibicao?"
      "ano=$ano&idCultura=$idCultura&idSolo=$idSolo&porcentagem=$porcentagem"
    ));
    final Map<String, dynamic> responseBody = _processResponse(response);

    final List<dynamic> municipiosData = responseBody["riscosAgricolasMunicipio"];
    final List<Municipio> listaDeMunicipios = municipiosData.map((municipio) => Municipio.fromJson(municipio)).toList();

    return listaDeMunicipios;
  }

  static Future<List<Cultura>> fetchCulturas() async {
    final Response response = await http.get(Uri.parse(culturasUri));
    final Map<String, dynamic> responseBody = _processResponse(response);

    final List<dynamic> culturas = responseBody["_embedded"]["culturas"];
    final List<Cultura> listaDeCulturas = culturas.map((cultura) => Cultura.fromJson(cultura)).toList();

    return listaDeCulturas;
  }

  static Future<List<Solo>> fetchSolos() async {
    final Response response = await http.get(Uri.parse(soloUri));
    final Map<String, dynamic> responseBody = _processResponse(response);

    final List<dynamic> solos = responseBody["_embedded"]["solo"];
    final List<Solo> listaDeSolos = solos.map((solo) => Solo.fromJson(solo)).toList();

    return listaDeSolos;
  }

  static Future<List<dynamic>> fetchAnosDisponiveis() async {
    final Response response = await http.get(Uri.parse(anosUri));

    if (response.statusCode == HttpStatus.ok) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar dados do servidor');
    }
  }

  static Map<String, dynamic> _processResponse(Response response) {
    if (response.statusCode == HttpStatus.ok) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Falha ao carregar dados do servidor');
    }
  }
}
