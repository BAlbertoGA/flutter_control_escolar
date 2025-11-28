import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_control_escolar/drawer.dart';
import 'package:flutter_control_escolar/listatareas.dart';
import 'package:flutter_control_escolar/routes.dart';

class MyFormularioTareas extends StatefulWidget {
  const MyFormularioTareas({super.key});

  @override
  State<MyFormularioTareas> createState() => MyFormularioTareasState();
}

class MyFormularioTareasState extends State<MyFormularioTareas> {
  final _formKey = GlobalKey<FormState>();
  final crtlId = TextEditingController();
  final crtlNombre = TextEditingController();
  final crtlDescripcion = TextEditingController();
  bool nuevaTarea = true;

  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context)?.settings.arguments);
    if (id != null) {
      nuevaTarea = false;
      var tareasLista = MyListaTareas.tareas.firstWhere(
        (alumno) => alumno['id'] == id,
      );
      crtlId.text = tareasLista['id'].toString();
      crtlNombre.text = tareasLista['name'];
      crtlDescripcion.text = tareasLista['descripcion'].toString();
    }
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text("Formulario de Alumnos")),
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                enabled: nuevaTarea,
                controller: crtlId, //Agrega el valor de los controllers
                decoration: InputDecoration(label: Text("ID")),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el ID';
                  }
                  if (int.tryParse(value) == null) {
                    return 'El ID debe ser numerico';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: crtlNombre, //Agrega el valor de los controllers
                decoration: InputDecoration(label: Text("Tarea")),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: crtlDescripcion, //Agrega el valor de los controllers
                decoration: InputDecoration(label: Text("Descipcion")),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese una descripcion';
                  }
                  return null;
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String idTarea = crtlId.text;
                    String nombreTarea = crtlNombre.text;
                    String descripcion = crtlDescripcion.text;

                    if (!nuevaTarea) {
                      int indexAlumno = MyListaTareas.tareas.indexWhere(
                        (alumno) => alumno['id'] == id,
                      );
                      MyListaTareas.tareas[indexAlumno] = {
                        'id': int.parse(idTarea),
                        'name': nombreTarea,
                        'descripcion': int.parse(descripcion),
                      };

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Datos Actualizados')),
                      );
                    } else {
                      MyListaTareas.tareas.add({
                        'id': int.parse(idTarea),
                        'name': nombreTarea,
                        'descripcion': int.parse(descripcion),
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Alumno Agregado')),
                      );
                    }
                    Navigator.pushNamed(context, AppRoutes.rutaTareas);
                  }
                },
                child: Text(nuevaTarea ? "Enviar" : "Actualizar Alumno"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
