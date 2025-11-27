import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/drawer.dart';

class MyMaterias extends StatefulWidget {
  const MyMaterias({super.key});

  @override
  State<MyMaterias> createState() => _MyMateriasState();
}

class _MyMateriasState extends State<MyMaterias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materias'),
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/imagen2.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 94, 220, 217),
                        Color.fromARGB(255, 0, 150, 136),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(206, 90, 21, 21),
                        blurRadius: 5,
                        offset: Offset(10, 10),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(
                      "Matematicas",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      print("Matematicas");
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 94, 220, 217),
                        Color.fromARGB(255, 0, 150, 136),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(206, 90, 21, 21),
                        blurRadius: 5,
                        offset: Offset(10, 10),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(
                      "Historia",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      print("Historia");
                    },
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 70,
                  width: 300,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 94, 220, 217),
                        Color.fromARGB(255, 0, 150, 136),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(206, 90, 21, 21),
                        blurRadius: 5,
                        offset: Offset(10, 10),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(
                      "Programacion",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () {
                      print("Programacion");
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
