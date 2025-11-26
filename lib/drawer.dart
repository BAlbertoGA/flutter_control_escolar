import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/imagen1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            child: Center(
              child: Text(
                "Control Escolar",
                style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Sección de Gestión de alumnos con submenú
          ExpansionTile(
            leading: const Icon(Icons.manage_accounts),
            title: const Text('Gestión de alumnos'),
            childrenPadding: const EdgeInsets.only(left: 16, right: 16),
            children: [
              ListTile(
                leading: const Icon(Icons.search),
                title: const Text('Buscar alumno'),
                onTap: () {
                  print("Buscar alumno");
                //   Navigator.pop(context); // cerrar drawer
                //   Navigator.pushNamed(context, '/ruta_buscar_alumno');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: const Text('Añadir alumno'),
                onTap: () {
                  print("Añadir alumno");
                //   Navigator.pop(context); // cerrar drawer
                //   Navigator.pushNamed(context, '/ruta_agregar_alumno');
                },
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Lista alumnos"),
            onTap: () {
              Navigator.pop(context); // Cerrar el drawer
              Navigator.pushNamed(context, '/rutalistaalumnos');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Captura calificaciones"),
            onTap: () {
              Navigator.pop(context); // Cerrar el drawer
              Navigator.pushNamed(context, '/rutacapturacalificaciones');
            },
          ),
        ],
      ),
    );
  }
}
