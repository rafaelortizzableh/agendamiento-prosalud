import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendamiento - Profesionales de la salud',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Color(0xFF0F9FA7),
        accentColor: Color(0xFF0DA3D8),
        fontFamily: 'Montserrat',
      ),
      home: FormScreen(),
    );
  }
}
