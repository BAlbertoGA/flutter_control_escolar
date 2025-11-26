import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/mylistview.dart';

class Detallealumno extends StatelessWidget {
  const Detallealumno({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    var alumno = MyListView.alumnos.firstWhere((element) => element['id'] == id);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle del Alumno'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: IntrinsicHeight(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.all(12),
                  child: const Text(
                    'Detalle del Alumno',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  // ya no hay height/width fijo para que se ajuste al contenido
                  decoration: const BoxDecoration(
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min, // importante para que shrinquee
                    children: [
                      const Padding(padding: EdgeInsets.symmetric(horizontal: 6)),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.person, size: 30, color: Colors.black),
                          SizedBox(height: 12),
                          Icon(Icons.phone, size: 30, color: Colors.black),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alumno: ${alumno['name']}',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Teléfono: ${alumno['phone']}',
                              style: const TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}