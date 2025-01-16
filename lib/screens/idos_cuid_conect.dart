import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConectScrenn(),
    );
  }
}
class ConectScrenn extends StatefulWidget {
  @override
  _ConectScreenState createState() => _ConectScreenState();
}

class _ConectScreenState extends State<ConectScrenn> {
  @override
Widget build(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  final screenWidth = MediaQuery.of(context).size.width;
  return Scaffold(
    body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.fill,
              )
            ),
          ),
          Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            height: screenHeight *0.90,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10.0,
                  spreadRadius: 5.0,
                  offset: Offset(0, -3),
                ),
              ],
            ),
              child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 50.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                        'Gostaria de Conectar-se ao seu Cuidador???',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontFamily: 'Helvetica', // Define a fonte personalizada
                          fontSize: 25, // Tamanho do texto (ajuste conforme necessário)
                          ),
                          textAlign: TextAlign.center,
                         ),
                        ),
                       SizedBox(height: 16),
                       SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: null,
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(vertical: 10.0),
                                            backgroundColor: const Color.fromARGB(255, 2, 122, 14), // Cor do botão
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                          ),
                                          child: Text(
                                            'Sim, Conectar agora',
                                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                                          ),
                                        ),
                                      ),
                              SizedBox(height: 16),
                                  SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: null,
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.symmetric(vertical: 10.0),
                                            backgroundColor: const Color.fromARGB(255, 2, 122, 14), // Cor do botão
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12.0),
                                            ),
                                          ),
                                          child: Text(
                                            'Não Continuar',
                                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                                          ),
                                        ),
                                      ),

      ]
      )
        )
       )
      ) 
      )
    ]
        
      )
    );
  }
}