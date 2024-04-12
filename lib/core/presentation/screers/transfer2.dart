import 'package:flutter/material.dart';
import 'package:safesuit_bank/core/presentation/screers/home.dart';
import 'package:safesuit_bank/core/presentation/screers/transfer.dart';

class Trans1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transferencias',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TransferenciasPage(),
    );
  }
}

class TransferenciasPage extends StatefulWidget {
  @override
  _TransferenciasPageState createState() => _TransferenciasPageState();
}

class _TransferenciasPageState extends State<TransferenciasPage> {
  TextEditingController cantidadController = TextEditingController(text: '\$0.00');
  String usuarioSeleccionado = ''; // Variable para almacenar el nombre del usuario seleccionado
  int numSecciones = 3; // Definición de la variable numSecciones

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferencias', 
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 242, 244, 250)
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 66, 79, 120),
        leading: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
          },
          child: const Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 242, 244, 250),
            size: 32,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Lógica para agregar un nuevo usuario si es necesario
              },
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(255, 205, 205, 205),
                onPrimary: const Color.fromARGB(255, 0, 43, 135),
                minimumSize: const Size(310, 80),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Agregar usuario',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              width: 310,
              height: 400,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 205, 205, 205),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  numSecciones,
                  (index) {
                    List<Map<String, dynamic>> datos = [
                      {"nombre": "Cristofer Abad Islas Ramirez", "numero": "******1234"},
                      {"nombre": "Diego Trujillo Serrano", "numero": "******5678"},
                      {"nombre": "Sergio Cadenas Gonzales", "numero": "******9101"},
                    ];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          usuarioSeleccionado = datos[index]["nombre"]; // Guarda el nombre del usuario seleccionado
                        });
                        // Navega a la siguiente ventana sin mostrar el usuario seleccionado en la pantalla actual
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Trans()));

                      },
                      child: Container(
                        width: 350,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 175, 175, 175),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        margin: const EdgeInsets.all(3),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${datos[index]["nombre"]}\n${datos[index]["numero"]}',
                            textAlign: TextAlign.left,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 43, 135)),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}

class TransName extends StatelessWidget {
  final String usuarioSeleccionado;

  const TransName({Key? key, required this.usuarioSeleccionado}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransName'),
      ),
      body: Center(
        child: Text('Usuario seleccionado: $usuarioSeleccionado'),
      ),
    );
  }
}
