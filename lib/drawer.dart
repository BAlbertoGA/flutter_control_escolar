import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                "Control Escolar",
                style: TextStyle(color: Colors.blueGrey, fontSize: 20),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/imagen1.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Lista alumnos"),
            onTap: () {
              Navigator.pushNamed(context, '/rutalistaalumnos');
            },
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("Captura calificaciones"),
            onTap: () {
              Navigator.pushNamed(context, '/rutacapturacalificaciones');
            },
          ),
        ],
      ),
    );
  }
}
