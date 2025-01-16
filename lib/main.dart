import 'package:cuida_comigo/screens/home_screen.dart';
import 'package:cuida_comigo/screens/cad_nome.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuida Comigo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => CadastroNomeScreen(),
      },
    );
  }
}