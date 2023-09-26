import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  final String imagePath; // Parâmetro para o caminho da imagem
  final String Title;
  final String Description;

  CustomCardWidget({required this.imagePath, required this.Title, required this.Description});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Sombra do card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Borda arredondada
      ),
      margin: const EdgeInsets.all(10), // Margem entre os cards
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Espaço para a foto
          Container(
            height: 150, // Altura da imagem
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath), // Use o caminho da imagem passado como parâmetro
                fit: BoxFit.cover, // Preenche o espaço com a imagem
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          // Espaço para o título
           Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              '$Title',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Espaço para o texto
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '$Description',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          // Botão "Ver mais" no canto inferior direito
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para o botão "Ver mais" aqui
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text('Ver mais', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}