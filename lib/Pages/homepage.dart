import 'package:flutter/material.dart';
import 'package:saar/Pages/Fragments/custom_card_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Índice da opção selecionada na BottomNavigationBar

  // Páginas associadas às opções da BottomNavigationBar
  final List<Widget> _pages = [
    // Página inicial (home)
    HomeFragment(), // Adicione o fragmento HomeFragment aqui
    // Página do calendário
    const Placeholder(
      color: Colors.green,
    ),
    // Página da fruta
    const Placeholder(
      color: Colors.green,
    ),
    // Página de configurações
    const Placeholder(
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nome do App'),
        backgroundColor: Colors.green, // Cor de fundo da AppBar
        iconTheme: const IconThemeData(color: Colors.white), // Cor dos ícones da AppBar
      ),
      body: _pages[_selectedIndex], // Mostra a página correspondente à opção selecionada
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: Colors.green, // Cor de fundo da BottomNavigationBar
        ),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white), // Ícone branco
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Colors.white), // Ícone branco
              label: 'Calendário',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.local_florist, color: Colors.white), // Ícone branco
              label: 'Fruta',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white), // Ícone branco
              label: 'Configurações',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green, // Cor do item selecionado (ícone)
          onTap: _onItemTapped, // Callback quando um item é pressionado
        ),
      ),
    );
  }

  // Função para atualizar a página quando um item da BottomNavigationBar é pressionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CustomCardWidget(imagePath: 'assets/Cards/mandioca.png'), // Adicione o widget personalizado aqui
        CustomCardWidget(imagePath: 'assets/Cards/algodao.png'),
        // Adicione mais instâncias do widget personalizado, se necessário
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}