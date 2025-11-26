import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  const Drawer({super.key, required ListView child});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 94, 220, 217),
                  Color.fromARGB(255, 0, 150, 136),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              // Usar una imagen de fondo
              image: DecorationImage(
                image: AssetImage('assets/images/imagen1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Text(
              'Control Escolar',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Listas de opciones del Drawer
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Alumnos'),
            onTap: () {
              Navigator.pop(context, '/rutalistaalumnos');
            },
          ),
          ListTile(
            leading: const Icon(Icons.school),
            title: const Text('Captura de Calificaciones'),
            onTap: () {
              Navigator.pushNamed(context, '/capturacalificaciones');
            },
          ),
        ],
      ),
    );
  }
}
