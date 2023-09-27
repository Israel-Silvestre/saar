import 'package:flutter/material.dart';

class CultureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CultureItem(
            imagePath: 'assets/Culturas/batataDoce.png',
            name: 'Banana',
            description: 'Banana é bom demais.',
          ),
          CultureItem(
            imagePath: 'assets/Culturas/sorgo.png', // Substitua pelo caminho da imagem da segunda cultura
            name: 'Mamão',
            description: 'Mamão é irado.',
          ),
          // Adicione mais instâncias do CultureItem com diferentes imagens, nomes e descrições, se necessário
        ],
      ),
    );
  }
}

class CultureItem extends StatelessWidget {
  final String imagePath; // Caminho da imagem
  final String name; // Nome da cultura
  final String description; // Descrição breve da cultura

  CultureItem({
    required this.imagePath,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Sombra do card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Borda arredondada
      ),
      margin: const EdgeInsets.all(4), // Margem entre os cards
      child: Row(
        children: [
          // Espaço para a foto de perfil (centralizado à esquerda)
          Container(
            width: 80, // Largura da imagem
            height: 80, // Altura da imagem
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover, // Preenche o espaço com a imagem
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          // Espaço para o nome e descrição (à direita da imagem)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nome da cultura (estilo de título)
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // Descrição breve da cultura
                  Text(
                    description,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}