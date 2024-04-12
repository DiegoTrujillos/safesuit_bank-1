import 'package:flutter/material.dart';
import 'package:safesuit_bank/core/presentation/screers/transfer2.dart';
import 'package:safesuit_bank/core/presentation/screers/transfer3.dart';

class Trans extends StatelessWidget {
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
  String cantidad = ''; // Variable para almacenar la cantidad introducida

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferencias',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            color: Color.fromARGB(255, 242, 244, 250),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 66, 79, 120),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Trans1()));
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
            TextField(
              controller: cantidadController,
              textAlign: TextAlign.center,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: const TextStyle(fontSize: 100.0, color: Color.fromARGB(255, 66, 79, 120)),
            ),
            SizedBox(height: 80.0),
            SizedBox(
              width: 300,
              height: 50,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 205, 205, 205),
                  hintText: 'Concepto',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                ),
              ),
            ),
            SizedBox(height: 25.0),
            ElevatedButton(
              onPressed: () {
                // Guarda las variables emisor y monto
                String emisor = 'Juan'; // Supongamos que 'Juan' es el emisor
                String monto = cantidadController.text; // Obtiene el monto del controlador
            
                // Navega a la vista Trans3 y pasa las variables emisor y monto
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Trans3(emisor: emisor, monto: monto),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Color.fromARGB(255, 242, 244, 250),
                minimumSize: Size(150, 50),
              ),
              child: Text(
                'Enviar',
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(height: 150.0),
          ],
        ),
      ),
    );
  }
}

// Clase para la siguiente ventana
class NextScreen extends StatelessWidget {
  final String cantidad; // Variable para almacenar la cantidad

  const NextScreen({Key? key, required this.cantidad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Siguiente Ventana'),
      ),
      body: Center(
        child: Text('Cantidad almacenada: $cantidad'), // Muestra la cantidad almacenada
      ),
    );
  }
}
