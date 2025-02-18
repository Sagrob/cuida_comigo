import 'package:cuida_comigo/main.dart';
import 'package:cuida_comigo/screens/calendario.dart';
import 'package:cuida_comigo/screens/compras.dart';
import 'package:cuida_comigo/screens/lazer.dart';
import 'package:cuida_comigo/screens/paciente.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OptionsScreen(),
      routes: {
        '/calendario': (context) => AgendaScreen(),
        '/paciente': (context) => PacienteScreen(),
        '/compras': (context) => MarketplaceScreen(),
        '/lazer': (context) => LazerScreen(),
      },
    );
  }
}

class OptionsScreen extends StatelessWidget{
  final List<OptionItem> options = [
    OptionItem('Calendário', 'lib/assets/images/calendario.png'),
    OptionItem('Meu paciente', 'lib/assets/images/paciente.png'),
    OptionItem('Comunidade', 'lib/assets/images/comunidade.png'),
    OptionItem('Lazer', 'lib/assets/images/lazer.png'),
    OptionItem('Dicas', 'lib/assets/images/dicas.png'),
    OptionItem('Direitos dos Idosos', 'lib/assets/images/direitos.png'),
    OptionItem('Autocuidado', 'lib/assets/images/autocuidado.png'),
    OptionItem('Compras', 'lib/assets/images/compras.png'),
    OptionItem('Lembretes', 'lib/assets/images/lembretes.png'),
    OptionItem('Personalize seus lembretes', 'lib/assets/images/personalizar.png'),
    OptionItem('Vagas para Cuidador', 'lib/assets/images/vagas.png'),
    OptionItem('Consulta Médica Online', 'lib/assets/images/consulta.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                ElevatedButton(
                  onPressed: () {
                    print('Botão de Emergência Pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                  ),
                  child: Text(
                    'Emergência',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )
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
                        switch (option.title){
                          case 'Calendário':
                          Navigator.pushNamed(context, '/calendario');
                          break;
                          case 'Meu paciente':
                          Navigator.pushNamed(context, '/paciente');
                          break;
                          case 'Lazer':
                          Navigator.pushNamed(context, '/lazer');
                          break;
                          case 'Compras':
                          Navigator.pushNamed(context, '/compras');
                          break;
                          default:
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text('Erro'),
                              content: Text('Página não encontrada para "${option.title}".'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('OK'),
                                )
                              ],
                            ) 
                          );
                        }
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
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )
                )
              )
            ],
          ),
        );
      }
    }

class OptionItem {
  final String title;
  final String imagePath;

  OptionItem(this.title, this.imagePath);
}