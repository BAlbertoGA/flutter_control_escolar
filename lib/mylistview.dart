import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  static const alumnos = [
    {'id': 1, 'name': 'Juan Perez', 'phone': 5555},
    {'id': 2, 'name': 'Maria Lopez Gonzalez', 'phone': 3333},
    {'id': 3, 'name': 'Carlos', 'phone': 4444},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Control Escolar')),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (_, index) => GestureDetector(
            onTap: () {
              // Navegar a la pantalla de detalle del alumno
              Navigator.pushNamed(
                context,
                "/rutadetallealumno",
                arguments: alumnos[index]['id'],
              );
              print("${alumnos[index]['name']} - ${alumnos[index]['phone']}");
            },
            child: Container(
              height: 70,
              //estilo del contenedor
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
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.only(left: 20)),
                  //iconos
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(height: 4),
                      const Icon(Icons.phone),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    //informacion del alumno
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${alumnos[index]['name']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "${alumnos[index]['phone']}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          separatorBuilder: (_, int index) {
            return const Divider(height: 2, color: Colors.red);
          },

          itemCount: alumnos.length,
        ),
      ),
    );
  }
}
