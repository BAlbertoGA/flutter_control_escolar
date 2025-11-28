import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/drawer.dart';
import 'package:flutter_control_escolar/routes.dart';

class MyListaTareas extends StatefulWidget {
  const MyListaTareas({super.key});

  static List tareas = [
    {
      'id': 4, 'name': "Nombre de la tarea 1", 'descripcion': "Descipcion de la tarea",
    },
    {
      'id': 5, 
      'name': "Nombre de la tarea 2", 
      'descripcion': "Descipcion de la tarea",
    },
    {
      'id': 6, 
      'name': "Nombre de la tarea 3", 
      'descripcion': "Descipcion de la tarea",
    },
    {
      'id': 7, 
      'name': "Nombre de la tarea 4", 
      'descripcion': "Descipcion de la tarea",
    },
  ];

  @override
  State<MyListaTareas> createState() => MyListaTareasState();
}

class MyListaTareasState extends State<MyListaTareas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista Tareas'),
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
      body: SafeArea(
        child: ListView.separated(
          // Recorre cada uno de los elementos
          itemBuilder: (_, index) => GestureDetector(
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
              margin: const EdgeInsets.all(20),
              alignment: Alignment.center,

              child: Row(
                children: [
                  Expanded(
                    //informacion del alumno
                    child: Column(
                      children: [
                        getListTitleElementLista(index, context),
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

          itemCount: MyListaTareas.tareas.length,
        ),
      ),
      floatingActionButton: getBottonFloatNuevoAlumno(),
    );
  }

  getListTitleElementLista(index, context) {
    return ListTile(
      title: Text(
        "${MyListaTareas.tareas[index]['name']}",
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      trailing: Wrap(
        spacing: 0,
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => getAlert(index, context),
              );
            },
            icon: Icon(Icons.delete),
            tooltip: "Eliminar",
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                AppRoutes.rutaFormTareas,
                arguments: MyListaTareas.tareas[index]['id'],
              );
            },
            icon: Icon(Icons.edit),
            tooltip: "Elitar",
          ),
        ],
      ),
    );
  }

  getAlert(index, context) {
    return AlertDialog(
      title: const Text("Desea Eliminar?"),
      content: Text("Se eliminara ${MyListaTareas.tareas[index]['tarea']}"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, 'Cancelar');
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              MyListaTareas.tareas.removeWhere(
                (item) => item['id'] == MyListaTareas.tareas[index]['id'],
              );
              Navigator.pop(context, 'OK');
            });
          },
          child: const Text('Aceptar'),
        ),
      ],
    );
  }

  getBottonFloatNuevoAlumno() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.rutaFormTareas);
      },
      child: const Icon(Icons.add),
    );
  }
}
