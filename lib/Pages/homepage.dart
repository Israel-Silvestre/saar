import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha App Flutter'), // Título da barra de aplicativos
      ),
      body: const Center(
        child: Text(
          'Bem-vindo à minha página inicial!', // Conteúdo da página inicial
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}