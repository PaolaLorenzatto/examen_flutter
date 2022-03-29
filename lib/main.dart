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
          seedColor: const Color(0xFF313D5A),
          secondary: const Color(0xFFBB4430),
          surface: const Color(0xFFBB4430),
          background: const Color(0xFFFFEAEE),
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
