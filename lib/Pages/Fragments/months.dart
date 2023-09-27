import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselsScreen extends StatefulWidget {
  @override
  _CarouselsScreenState createState() => _CarouselsScreenState();
}

class _CarouselsScreenState extends State<CarouselsScreen> {
  int _currentIndex = 0;
  String _selectedMonth = 'Janeiro'; // Mês selecionado inicialmente

  final List<String> carouselImages = [
    'assets/Cards/mandioca.png', // Substitua pelo caminho da sua imagem
    'assets/Cards/algodao.png', // Substitua pelo caminho da sua imagem
    'assets/Cards/mandioca.png', // Substitua pelo caminho da sua imagem
    'assets/Cards/algodao.png' // Substitua pelo caminho da sua imagem
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Reduzi a altura da barra aqui
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Centralizar à direita
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
                _buildCarousel('Frutas', 0),
                _buildCarousel('Verduras', 1),
                _buildCarousel('Leguminosas', 2),
                _buildCarousel('Raízes', 3),
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

  Widget _buildCarousel(String month, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Centralizar à esquerda
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            month,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CarouselSlider.builder(
          itemCount: carouselImages.length,
          options: CarouselOptions(
            height: 200, // Altura do carrossel
            aspectRatio: 1.0, // Proporção quadrada das imagens
            autoPlay: true, // Iniciar a reprodução automática
            enlargeCenterPage: true, // Destacar o slide central
            enableInfiniteScroll: true, // Ativar rolagem infinita
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            return _buildCarouselCard(
              imageAsset: carouselImages[index],
            );
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: carouselImages.asMap().entries.map((entry) {
            final int imageIndex = entry.key;
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == imageIndex ? Colors.green : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildCarouselCard({
    required String imageAsset,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0), // Borda arredondada
      ),
      child: Image.asset(
        imageAsset,
        width: double.infinity,
        height: 200, // Altura da imagem
        fit: BoxFit.cover,
      ),
    );
  }
}