import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/drawer.dart';

class Capturacalificaciones extends StatelessWidget {
  const Capturacalificaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captura de Calificaciones'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        // Usamos un Stack para superponer widgets
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/imagen2.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Container(
              width: 200,
              height: 200,
              margin: EdgeInsets.only(top: 20, left: 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 40, left: 40),
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 230, 133),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text("Captura de Calificaciones"),
                  ),
                ),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
