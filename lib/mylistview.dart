import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/drawer.dart';
import 'package:flutter_control_escolar/routes.dart';

class MyListView extends StatefulWidget {
  const MyListView({super.key});

  static List alumnos = [
    {'id': 1, 'name': 'Bryan', 'phone': 5555},
    {'id': 2, 'name': 'Alejandra', 'phone': 3333},
    {'id': 3, 'name': 'Carlos', 'phone': 4444},
  ];

  @override
  State<MyListView> createState() => _MyListViewState();
}

class _MyListViewState extends State<MyListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Control Escolar')),
      drawer: MyDrawer(),
      // endDrawer: MyDrawer(),
      body: SafeArea(
        child: ListView.separated(
          // Recorre cada uno de los elementos
          itemBuilder: (_, index) => GestureDetector(
            /*
            onTap: () {
              Navegar a la pantalla de detalle del alumno
              Navigator.pushNamed(
                context,
                "/rutadetallealumno",
                arguments: MyListView.alumnos[index]['id'],
              );
              print("${MyListView.alumnos[index]['name']} - ${MyListView.alumnos[index]['phone']}");
            },
            */
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
                  // Padding(padding: const EdgeInsets.only(left: 20)),
                  //iconos
                  /*
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.person),
                      const SizedBox(height: 4),
                      const Icon(Icons.phone),
                    ],
                  ),
                  */
                  // const SizedBox(width: 15),
                  Expanded(
                    //informacion del alumno
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getListTitleElementLista(index, context),
                        // Text(
                        //   "${MyListView.alumnos[index]['name']}",
                        // style: const TextStyle(
                        //   color: Colors.black,
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 16,
                        // ),
                        // ),
                        // const SizedBox(height: 4),
                        // Text(
                        //   "${MyListView.alumnos[index]['phone']}",
                        //   style: const TextStyle(
                        //     color: Colors.black,
                        //     fontSize: 16,
                        //   ),
                        // ),
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

          itemCount: MyListView.alumnos.length,
        ),
      ),
      floatingActionButton: getBottonFloatNuevoAlumno(),
    );
  }

  getListTitleElementLista(index, context) {
    return ListTile(
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.rutaDetalleAlumno,
            arguments: MyListView.alumnos[index]['id'],
          );
        },
        icon: Icon(Icons.remove_red_eye),
        tooltip: 'Mostrar',
      ),
      title: Text(
        "${MyListView.alumnos[index]['name']}",
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
                AppRoutes.rutaFormularioAlumno,
                arguments: MyListView.alumnos[index]['id'],
              );
            },
            icon: Icon(Icons.edit),
            tooltip: "Elitar",
          ),
        ],
      ),
    );
  }

  // Crea una ventana de alerta
  getAlert(index, context) {
    return AlertDialog(
      title: const Text("Desea Eliminar?"),
      content: Text("Se eliminara ${MyListView.alumnos[index]['name']}"),
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
              MyListView.alumnos.removeWhere(
                (item) => item['id'] == MyListView.alumnos[index]['id'],
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
        Navigator.pushNamed(context, AppRoutes.rutaFormularioAlumno);
      },
      child: const Icon(Icons.add),
    );
  }
}
