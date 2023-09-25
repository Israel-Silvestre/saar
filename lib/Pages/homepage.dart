import 'package:flutter/material.dart';

<<<<<<< HEAD
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Índice da opção selecionada na BottomNavigationBar

  // Páginas associadas às opções da BottomNavigationBar
  final List<Widget> _pages = [
    // Página inicial (home)
    Placeholder(
      color: Colors.green,
    ),
    // Página do calendário
    Placeholder(
      color: Colors.green,
    ),
    // Página da fruta
    Placeholder(
      color: Colors.green,
    ),
    // Página de configurações
    Placeholder(
      color: Colors.green,
    ),
  ];

=======
class HomePage extends StatelessWidget {
>>>>>>> Israel/master
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        title: Text('Nome do App'),
        backgroundColor: Colors.green, // Cor de fundo da AppBar
        iconTheme: IconThemeData(color: Colors.white), // Cor dos ícones da AppBar
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
          selectedItemColor: Colors.white, // Cor do item selecionado (ícone)
          onTap: _onItemTapped, // Callback quando um item é pressionado
=======
        title: Text('Minha App Flutter'), // Título da barra de aplicativos
      ),
      body: const Center(
        child: Text(
          'Bem-vindo à minha página inicial!', // Conteúdo da página inicial
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
>>>>>>> Israel/master
        ),
      ),
    );
  }
<<<<<<< HEAD

  // Função para atualizar a página quando um item da BottomNavigationBar é pressionado
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
=======
>>>>>>> Israel/master
}