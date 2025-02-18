import 'package:cuida_comigo/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PacienteScreen(),
    );
  }
}

class PacienteScreen extends StatelessWidget{
  final List<OptionItem> options = [
    OptionItem('Diário de Fraldas', 'lib/assets/images/diario.png'),
    OptionItem('Lista de remédios', 'lib/assets/images/remedios.png'),
    OptionItem('Atividade do paciente', 'lib/assets/images/celular.png'),
    ];

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
        icon: Row(
          children: [
            Icon(Icons.arrow_back, color: Colors.white),
            SizedBox(width: 4),
            Text(
              'Voltar',
              style: TextStyle(color: Colors.white, fontSize: 16),
              ),
          ],
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        ),
        title: Text('Paciente',
        style: TextStyle(color: Colors.white, fontSize: 25),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 91, 143, 75),
    ),
    body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('lib/assets/images/usuario.png'),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Olá, Usúario',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Bem-vindo!',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              ],
            ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Pesquise aqui...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  print('Texto digitado: $value');
                },
              ), 
            ),
            SizedBox(height: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 15 / 1,
                    ),
                    itemCount: options.length,
                    itemBuilder: (context, index) {
                      final option = options[index];
                      return GestureDetector(
                        onTap:() {
                          print('Clicou em: ${option.title}');
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Ação'),
                              content: Text('Você clicou em "${option.title}"!'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                  ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 49, 175, 21),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(2.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey[200],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    option.imagePath,
                                    fit: BoxFit.cover,
                                  )
                                ),
                              ),
                              SizedBox(height: 16),
                              Expanded(
                              child: Text(
                                option.title,
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                              )
                            )
                          ]
                        )
                      )
                    );
                  }
                )
              )
            )
          ]
        )
      );
    }
  }
class OptionItem {
  final String title;
  final String imagePath;

  OptionItem(this.title, this.imagePath);
}