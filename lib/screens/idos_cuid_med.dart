import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MedicationScrenn(),
    );
  }
}
class MedicationScrenn extends StatefulWidget {
  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScrenn> {
  List<Map<String, dynamic>> medications =[
    {"name": " ", "time": '', 'dosage':'', 'unit':'ml' },
  ];

  final List<String> units = ['ml', 'Comprimido'];


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
                    ...medications.map((medication) {
            int index = medications.indexOf(medication);
            return Row(
              children: [
                Flexible(
                  flex: 2,
                  child: TextField(
                    style: TextStyle(color: Colors.black, fontSize: 11),
                    decoration: InputDecoration(
                      hintText: 'Remédio',
                      hintStyle: TextStyle( color: Colors.grey),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 255, 255, 255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(115, 136, 135, 135)),
                      ),
                    ),
                    onChanged: (value) => medication['name'] = value,
                  ),
                ),
                SizedBox(width: 8),
                Flexible(
                  flex: 2,
                  child: TextField(
                    style: TextStyle(color: Colors.black, fontSize: 11),
                    decoration: InputDecoration(
                      hintText: '00:00',
                      hintStyle: TextStyle( color: Colors.grey),
                      filled: true,
                      fillColor: const Color.fromARGB(255,255,255,255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(115,136,135,135)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: (value) => medication['time'] = value,
                  ),
                ),
                SizedBox(width: 8,),
                Flexible(
                  flex: 2,
                  child: TextField(
                    style: TextStyle(color: Colors.black, fontSize: 11),
                    decoration: InputDecoration(
                      hintText: '0',
                      hintStyle: TextStyle( color: Colors.grey),
                      filled: true,
                      fillColor: const Color.fromARGB(255,255,255,255),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color.fromARGB(115,136,135,135)),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onChanged: (value) => medication['dosage'] = value,
                  ),
                ),
                SizedBox(width: 8,),
                Flexible(
                  flex: 3,
                  child: DropdownButtonFormField<String>(
                    value: medication['unit'],
                    onChanged: (String? newValue){
                      setState(() {
                        medication['unit'] = newValue!;
                      });
                    },
                    items: units.map((unit){
                     return DropdownMenuItem(
                      value: unit,
                      child: Text(unit),
                     );
                    }).toList(),
                    decoration: InputDecoration(labelText: 'unidade'),
                  ),
                ) ,
              ],
            );
            
              }).toList(),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    medications.add({'name': '', 'time': '', 'dosage': '', 'unit':'Comprimido'});
                  });
                },
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric( vertical: 10.0),
                    backgroundColor: const Color.fromARGB(255, 2, 122, 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Text('Proximo',
                  style: TextStyle(fontSize: 18, color: Colors.white),),
                  
                ),
              )
                ],
                )
              )
            ),
          )
        )
      ]
    ),
  );
}
}