import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saar/app_context.dart';
import 'package:saar/embrapa_api/models.dart';
import 'package:saar/Pages/risco.dart';

class CultureWidget extends StatefulWidget {

  const CultureWidget({Key? key}) : super(key: key);

  @override
  _CultureWidgetState createState() => _CultureWidgetState();
}

class _CultureWidgetState extends State<CultureWidget> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var crops = Provider.of<AppContextData>(context).contextCrops;
    var soils = Provider.of<AppContextData>(context).contextSoils;

    return Scaffold(
      body: FutureBuilder<List<Crop>>(
        future: crops,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erro: ${snapshot.error}');
          } else {
            return CropListBuilder(crops: snapshot.data ?? [], soils: soils);
          }
        },
      ),
    );
  }
}

class CropListBuilder extends StatelessWidget {
  final List<Crop> crops;
  final Future<List<Soil>> soils;

  const CropListBuilder({
    Key? key,
    required this.crops,
    required this.soils
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: crops.length,
      itemBuilder: (context, index) {
        final cultura = crops[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Risco(cultura: cultura, solosFuture: soils)),
          ),
          child: CropCardWidget(
            imagePath: cultura.imagePath,
            name: cultura.nome,
            description: cultura.type,
          ),
        );
      },
    );
  }
}

class CropCardWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;

  const CropCardWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
              borderRadius: const BorderRadius.only(
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 14),
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
