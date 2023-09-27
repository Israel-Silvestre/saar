import 'package:flutter/material.dart';

class CarouselsScreen extends StatefulWidget {
  @override
  _CarouselsScreenState createState() => _CarouselsScreenState();
}

class _CarouselsScreenState extends State<CarouselsScreen> {
  String _selectedMonth = 'Janeiro'; // Mês selecionado inicialmente

  final List<String> carouselImages = [
    'assets/Culturas/mandioca.png', // Substitua pelo caminho da sua imagem
    'assets/Culturas/milhoV.png', // Substitua pelo caminho da sua imagem
    'assets/Culturas/sorgo.png', // Substitua pelo caminho da sua imagem
    'assets/Culturas/batataDoce.png' // Substitua pelo caminho da sua imagem
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Cor da barra branca quase cinza
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _selectedMonth,
                  style: TextStyle(
                    color: Colors.black, // Cor do texto
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.calendar_today,
                    color: Colors.black, // Cor do ícone
                  ),
                  onPressed: () {
                    _showMonthYearPicker(context);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCarouselWithTitle('Frutas', 0),
                _buildCarouselWithTitle('Verduras', 1),
                _buildCarouselWithTitle('Leguminosas', 2),
                _buildCarouselWithTitle('Raízes', 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMonthYearPicker(BuildContext context) {
    // Implemente a lógica do pop-up do calendário aqui
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Selecione o Mês e o Ano'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Adicione widgets para selecionar o mês e o ano aqui
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Fechar o pop-up
              },
              child: Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCarouselWithTitle(String title, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 150.0, // Altura do carrossel
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: carouselImages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: 120.0,
                  width: 140.0, // Largura de cada item do carrossel
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage(carouselImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}