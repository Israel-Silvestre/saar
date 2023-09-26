import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:saar/PopUps/MonthYearPicker.dart';
import 'package:intl/intl.dart';

class CarouselsScreen extends StatefulWidget {
  @override
  _CarouselsScreenState createState() => _CarouselsScreenState();
}

class _CarouselsScreenState extends State<CarouselsScreen> {
  String selectedMonthYear = 'Janeiro 2023'; // Valor inicial do seletor de mês e ano

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Carrosséis',
          style: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF00921D),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Barra superior com o seletor de mês e ano
          Container(
            color: const Color(0xFF00921D),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MonthYearPicker(
                  onMonthYearSelected: (date) {
                    setState(() {
                      selectedMonthYear = DateFormat('MMMM yyyy').format(date);
                    });
                  },
                ),
                IconButton(
                  onPressed: () {
                    // Implemente aqui a ação para abrir o Pop-Up de seleção de mês e ano
                    // Você pode usar o MonthYearPicker para isso
                  },
                  icon: Icon(Icons.calendar_today, color: Colors.white),
                ),
              ],
            ),
          ),
          // Carrosséis de imagens
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselWithTitle(
                    title: 'Carrossel 1',
                    imagePathList: ['image1.jpg', 'image2.jpg', 'image3.jpg'],
                  ),
                  CarouselWithTitle(
                    title: 'Carrossel 2',
                    imagePathList: ['image4.jpg', 'image5.jpg', 'image6.jpg'],
                  ),
                  CarouselWithTitle(
                    title: 'Carrossel 3',
                    imagePathList: ['image7.jpg', 'image8.jpg', 'image9.jpg'],
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

class CarouselWithTitle extends StatelessWidget {
  final String title;
  final List<String> imagePathList;

  CarouselWithTitle({
    required this.title,
    required this.imagePathList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 200, // Altura do carrossel
            enableInfiniteScroll: false, // Desativa o rolagem infinita
          ),
          items: imagePathList.map((imagePath) {
            return Image.asset(
              imagePath,
              fit: BoxFit.cover,
            );
          }).toList(),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}