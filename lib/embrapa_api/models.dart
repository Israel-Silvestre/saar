class Municipio {
  final String nome;
  final double latitude;
  final double longitude;
  final List<List<bool>> viabilidades;

  const Municipio({
    required this.nome,
    required this.latitude,
    required this.longitude,
    required this.viabilidades,
  });

  factory Municipio.fromJson(Map<String, dynamic> municipioData) {
    final List<bool> viabilidades = List.generate(36, (index) => municipioData["d${index + 1}"] == "S");

    final List<List<bool>> viabilidadesSplit = List.generate(
      (viabilidades.length / 3).ceil(),
      (index) {
        final start = index * 3;
        final end = start + 3;
        return viabilidades.sublist(start, end);
      }
    );

    return Municipio(
      nome: municipioData["municipio"]["nome"],
      latitude: municipioData["municipio"]["latitude"],
      longitude: municipioData["municipio"]["longitude"],
      viabilidades: viabilidadesSplit
    );
  }
}

class Crop {
  final int id;
  final String nome;
  final String imagePath;
  final String type;

  static const Map<int, dynamic> categorias = {
    2: {
      "imagePath": "assets/Culturas/girassol.png",
      "categoria": "Grãos",
    },
    3: {
      "imagePath": "assets/Culturas/algodao.png",
      "categoria": "Grãos",
    },
    4: {
      "imagePath": "assets/Culturas/milhoS.png",
      "categoria": "Grãos"
    },
    5: {
      "imagePath":  "assets/Culturas/feijaoV.png",
      "categoria": "Leguminosas",
    },
    6: {
      "imagePath": "assets/Culturas/feijaoS.png",
      "categoria": "Leguminosas",
    },
    7: {
      "imagePath": "assets/Culturas/milhoV.png",
      "categoria": "Grãos",
    },
    8: {
      "imagePath": "assets/Culturas/sorgo.png",
      "categoria": "Grãos",
    },
    9: {
      "imagePath": "assets/Culturas/batataDoce.png",
      "categoria": "Raízes",
    },
    10: {
      "imagePath": "assets/Culturas/mandioca.png",
      "categoria": "Raízes",
    },
    11: {
      "imagePath": "assets/Culturas/gergelim.png",
      "categoria": "Grãos",
    },
    12: {
      "imagePath": "assets/Culturas/cebola.png",
      "categoria": "Hortaliças",
    },
  };

  const Crop({
    required this.id,
    required this.nome,
    required this.imagePath,
    required this.type,
  });

  factory Crop.fromJson(Map<String, dynamic> culturaData) {
    return Crop(
        id: culturaData["id"],
        nome: culturaData["nome"],
        imagePath: categorias[culturaData["id"]]["imagePath"],
        type: categorias[culturaData["id"]]["categoria"]
    );
  }

  factory Crop.fromJsonStorage(Map<String, dynamic> culturaData) {
    return Crop(
        id: culturaData["id"],
        nome: culturaData["nome"],
        imagePath: culturaData["imagePath"],
        type: culturaData["categoria"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "nome": nome,
      "imagePath": imagePath,
      "type": type,
    };
  }
}

class Soil {
  final int id;
  final String nome;
  final String title;
  final String subtitle;
  final String imagePath;

  static const Map<int, dynamic> soloInfo = {
    1: {"title": "Solo Tipo 1", "subtitle": "Arenoso", "imagePath": "assets/Solos/SoloTipo1.png"},
    2: {"title": "Solo Tipo 2", "subtitle": "Arenoargiloso", "imagePath": "assets/Solos/SoloTipo2.png"},
    3: {"title": "Solo Tipo 3", "subtitle": "Argiloso", "imagePath": "assets/Solos/SoloTipo3.png"},
  };

  const Soil({
    required this.id,
    required this.nome,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  factory Soil.fromJson(Map<String, dynamic> soloData) {
    final int id = soloData["id"];

    return Soil(
      id: id,
      nome: soloData["nome"],
      title: soloInfo[id]["title"],
      subtitle: soloInfo[id]["subtitle"],
      imagePath: soloInfo[id]["imagePath"],
    );
  }
}
