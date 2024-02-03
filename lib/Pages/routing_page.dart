import 'package:flutter/material.dart';

import 'crop_month/crop_month_page.dart';
import 'crop_page/culturas.dart';
import 'home_page/page.dart';
import 'settings_page/settings.dart';

class PageRouting extends StatefulWidget {
  const PageRouting({super.key});

  @override
  _PageRoutingState createState() => _PageRoutingState();
}

class _PageRoutingState extends State<PageRouting> {
  int _selectedPageIndex = 0;
  final List<Widget> _pages = [const PlantsInfoPage(), const MonthsList(), const CultureWidget(), SettingsFragment()];

  void _onItemTapped(int index) {
    setState(() {_selectedPageIndex = index;});
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
            BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home, color: Colors.white)),
            BottomNavigationBarItem(label: 'Calendário', icon: Icon(Icons.calendar_today, color: Colors.white) ),
            BottomNavigationBarItem(label: 'Cultura', icon: Icon(Icons.local_florist, color: Colors.white)),
            BottomNavigationBarItem(label: 'Configurações', icon: Icon(Icons.settings, color: Colors.white)),
          ],
          selectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
