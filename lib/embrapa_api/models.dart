class Municipio {
  final String nome;
  final double latitude;
  final double longitude;
  final List<bool> viabilidades;

  const Municipio({
    required this.nome,
    required this.latitude,
    required this.longitude,
    required this.viabilidades,
  });

  factory Municipio.fromJson(Map<String, dynamic> municipioData) {
    final String nome = municipioData["municipio"]["nome"];
    final double latitude = municipioData["municipio"]["latitude"];
    final double longitude = municipioData["municipio"]["longitude"];
    final List<bool> viabilidades = List.generate(36, (index) => municipioData["municipio"]["d${index + 1}"] == "S");

    return Municipio(nome: nome, latitude: latitude, longitude: longitude, viabilidades: viabilidades);
  }
}

class Cultura {
  final int id;
  final String nome;

  const Cultura({
    required this.id,
    required this.nome,
  });

  factory Cultura.fromJson(Map<String, dynamic> culturaData) {
    return Cultura(id: culturaData["id"], nome: culturaData["nome"]);
  }
}

class Solo {
  final int id;
  final String nome;

  const Solo({
    required this.id,
    required this.nome,
  });

  factory Solo.fromJson(Map<String, dynamic> soloData) {
    return Solo(id: soloData["id"], nome: soloData["nome"]);
  }
}
