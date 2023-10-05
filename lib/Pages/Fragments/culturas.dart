import 'package:flutter/material.dart';
import 'package:saar/Factories/culturaFactory.dart';

class CultureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cultureItems = CulturaFactory.getCulturas; // Use o método get para obter a lista de culturas

    return Scaffold(
      appBar: AppBar(
        title: Text('Culturas'),
      ),
      body: ListView.builder(
        itemCount: cultureItems.length,
        itemBuilder: (context, index) {
          final culture = cultureItems[index];
          return CultureItemWidget(
            imagePath: culture.imagePath,
            name: culture.name,
            description: culture.description,
          );
        },
      ),
    );
  }
}

class CultureItemWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;

  CultureItemWidget({
    required this.imagePath,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.all(4),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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