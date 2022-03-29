import 'package:flutter/material.dart';

import './nombre_apellido.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Examen Flutter',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFAAA8D),
          secondary: const Color(0xFF19297C),
          surface: const Color(0xFFD8DCFF),
          background: const Color(0xFFAEADF0),
          onSurface: Colors.white,
          onSecondary: Colors.black,
        ),
      ),
      home: const MyHomePage(),
    ); 
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nombre y Apellido'),),
      body: const NombreApellidoWidget(),
    );
  }
}
