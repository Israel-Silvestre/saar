import 'package:flutter/material.dart';

import '../embrapa_api/models.dart';
import '../embrapa_api/service.dart';
import 'crop_page/culturas.dart';
import 'crop_month/crop_month_page.dart';
import 'settings_page/settings.dart';
import 'home_page/page.dart';

class PageRouting extends StatefulWidget {
  const PageRouting({super.key});

  @override
  _PageRoutingState createState() => _PageRoutingState();
}

class _PageRoutingState extends State<PageRouting> {
  int _selectedPageIndex = 0;
  List<Widget> _pages = [];

  late Future<List<Cultura>> _culturasFuture;
  late Future<List<dynamic>> _anosDisponiveisFuture;
  late Future<List<Solo>> _solosFuture;

  void _onItemTapped(int index) {
    setState(() {_selectedPageIndex = index;});
  }

  @override
  void initState() {
    super.initState();
    _culturasFuture = EmbrapAPI.fetchCulturas();
    _anosDisponiveisFuture = EmbrapAPI.fetchAnosDisponiveis();
    _solosFuture = EmbrapAPI.fetchSolos();

    _pages = [
      PlantsInfoPage(),
      MonthsList(culturasFuture: _culturasFuture),
      CultureWidget(culturasFuture: _culturasFuture, solosFuture: _solosFuture),
      SettingsFragment(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Amigo Agricultor', style: TextStyle(fontFamily: 'Roboto', color: Colors.white)),
        backgroundColor: const Color(0xFF00921D),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: _pages[_selectedPageIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: const Color(0xFF00921D)),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today, color: Colors.white), label: 'Calendário'),
            BottomNavigationBarItem(icon: Icon(Icons.local_florist, color: Colors.white), label: 'Cultura'),
            BottomNavigationBarItem(icon: Icon(Icons.settings, color: Colors.white), label: 'Configurações',),
          ],
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
