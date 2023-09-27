import 'package:flutter/material.dart';
import 'package:saar/Pages/Fragments/culturas.dart';
import 'package:saar/Pages/Fragments/custom_card_widget.dart';
import 'package:saar/Pages/Fragments/months.dart';
import 'package:saar/Pages/Fragments/settings.dart';

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
    CarouselsScreen(),
    // Página da fruta
    CultureWidget(),
    // Página de configurações
    SettingsFragment(), // Adicione a classe SettingsFragment aqui
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Amigo Agricultor',
          style: TextStyle(
            fontFamily: 'Roboto', // Defina a fonte Roboto
            color: Colors.white, // Cor do texto como branco
          ),
        ),
        backgroundColor: const Color(0xFF00921D), // Cor de fundo da AppBar (hexadecimal)
        iconTheme: const IconThemeData(color: Colors.white), // Cor dos ícones da AppBar
      ),
      body: _pages[_selectedIndex], // Mostra a página correspondente à opção selecionada
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: const Color(0xFF00921D), // Cor de fundo da BottomNavigationBar (hexadecimal)
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
              label: 'Cultura',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, color: Colors.white), // Ícone branco
              label: 'Configurações',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white, // Cor do item selecionado (ícone)
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
        CustomCardWidget(
          imagePath: 'assets/Culturas/mandioca.png',
          title: 'Mandioca',
          description:
          'Clima no Rio Grande do Norte tende a favorecer o plantio de mandioca nos meses de janeiro até março',
        ), // Adicione o widget personalizado aqui
        CustomCardWidget(
          imagePath: 'assets/Culturas/batataDoce.png',
          title: 'Batata Doce',
          description:
          'Batata Doce vem se mostrando muito eficaz quando falamos de colheita em períodos de seca, no Sul do Rio Grande do Norte, veja mais...',
        ),
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