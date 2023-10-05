class CulturaFactory {

  static List<CultureItem> todasAsCulturas = [
    CultureItem(imagePath: 'assets/Culturas/algodao.png', name: 'Algodão', description: 'Raíz'),
    CultureItem(imagePath: 'assets/Culturas/batataDoce.png', name: 'Batata Doce', description: 'Raíz'),
    CultureItem(imagePath: 'assets/Culturas/cebola.png', name: 'Cebola', description: 'Verdura'),
    CultureItem(imagePath: 'assets/Culturas/feijaoS.png', name: 'Feijao Seco', description: 'Leguminosa'),
    CultureItem(imagePath: 'assets/Culturas/feijaoV.png', name: 'Feijão verde', description: 'Leguminosa'),
    CultureItem(imagePath: 'assets/Culturas/gergelim.png', name: 'Gergelim', description: 'Leguminosa'),
    CultureItem(imagePath: 'assets/Culturas/girassol.png', name: 'Girassol', description: 'Fruta'),
    CultureItem(imagePath: 'assets/Culturas/mandioca.png', name: 'Mandioca', description: 'Raíz'),
    CultureItem(imagePath: 'assets/Culturas/milhoS.png', name: 'Milho Seco', description: 'Verdura'),
    CultureItem(imagePath: 'assets/Culturas/milhoV.png', name: 'Milho Verde', description: 'Verdura'),
    CultureItem(imagePath: 'assets/Culturas/sorgo.png', name: 'Sorgo', description: 'Verdura')
  ];

  static List<CultureItem> get getCulturas => todasAsCulturas;
}

class CultureItem {
  final String imagePath; // Caminho da imagem
  final String name; // Nome da cultura
  final String description; // Descrição breve da cultura

  CultureItem({
    required this.imagePath,
    required this.name,
    required this.description,
  });
}