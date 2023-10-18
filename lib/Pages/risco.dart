import 'package:flutter/material.dart';
import 'package:saar/embrapa_api/models.dart';

class Risco extends StatefulWidget {
  final Cultura cultura;

  Risco({required this.cultura});

  @override
  _RiscoState createState() => _RiscoState();
}

class _RiscoState extends State<Risco> {
  late Cultura _cultura;
  late List<Map<String, String>> _cardAttributes;

  @override
  void initState() {
    super.initState();
    _cultura = widget.cultura;
    _cardAttributes = [
      {"title": "Solo Tipo 1", "subtitle": "Arenoso", "imagePath": "assets/Solos/SoloTipo1.png"},
      {"title": "Solo Tipo 2", "subtitle": "Arenoargiloso", "imagePath": "assets/Solos/SoloTipo2.png"},
      {"title": "Solo Tipo 3", "subtitle": "Argiloso", "imagePath": "assets/Solos/SoloTipo3.png"},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Risco Climático'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.75,
              color: Colors.grey[200],
              child: Image.asset(
                _cultura.imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _cultura.nome,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              _cardAttributes[index]["title"]!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              _cardAttributes[index]["subtitle"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(_cardAttributes[index]["imagePath"]!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
