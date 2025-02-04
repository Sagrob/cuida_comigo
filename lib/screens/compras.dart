import 'package:cuida_comigo/main.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MarketplaceScreen(),
    );
  }
}

class MarketplaceScreen extends StatelessWidget {
  final List<Product> featuredProducts = [
    Product('Dipirona Monoidratada', 'lib/assets/image/dip.jpg', 29.99),
    Product('Camiseta Casual', 'lib/assets/image/camiseta.jpg', 49.99),
    Product('Leite Integral', 'lib/assets/image/leite.jpg', 5.99),
    Product('Xarope', 'lib/assets/image/xarope.jpg', 89.99),
  ];

  final List<String> carouselImage = [
    'lib/assets/images/farm.jpg',
    'lib/assets/images/todos.png',
    'lib/assets/images/merc.png',
    'lib/assets/images/vest.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 0, 0, 0)),
              onPressed: () => Navigator.pop(context),
            ),
            const Text(
              'Voltar',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        actions: [],
      ),
    )
  }
}