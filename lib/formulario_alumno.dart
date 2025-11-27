import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_control_escolar/drawer.dart';
import 'package:flutter_control_escolar/mylistview.dart';
import 'package:flutter_control_escolar/routes.dart';

class MyFormularioAlumno extends StatefulWidget {
  const MyFormularioAlumno({super.key});

  @override
  State<MyFormularioAlumno> createState() => MyFormularioAlumnoState();
}

class MyFormularioAlumnoState extends State<MyFormularioAlumno> {
  final _formKey = GlobalKey<FormState>();
  final crtlId = TextEditingController();
  final crtlNombre = TextEditingController();
  final crtlTelefono = TextEditingController();
  bool nuevoAlumno = true;

  @override
  Widget build(BuildContext context) {
    final id = (ModalRoute.of(context)?.settings.arguments);
    if (id != null) {
      nuevoAlumno = false;
      var alumnoLista = MyListView.alumnos.firstWhere(
        (alumno) => alumno['id'] == id,
      );
      crtlId.text = alumnoLista['id'].toString();
      crtlNombre.text = alumnoLista['name'];
      crtlTelefono.text = alumnoLista['phone'].toString();
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
                decoration: InputDecoration(label: Text("Nombre")),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un nombre';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: crtlTelefono, //Agrega el valor de los controllers
                decoration: InputDecoration(label: Text("Telefono")),
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese un numero de telefono';
                  }
                  if (int.tryParse(value) == null) {
                    return 'El telefono debe ser numerico';
                  }

                  return null;
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String idAlumno = crtlId.text;
                    String nombreAlumno = crtlNombre.text;
                    String telefonoAlumno = crtlTelefono.text;

                    if (!nuevoAlumno) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Datos Actualizados')),
                      );
                    } else {
                      MyListView.alumnos.add({
                        'id': int.parse(idAlumno),
                        'name': nombreAlumno,
                        'phone': int.parse(telefonoAlumno),
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Alumno Agregado')),
                      );
                    }
                    Navigator.pushNamed(context, AppRoutes.rutaListaAlumnos);
                  }
                },
                child: Text(nuevoAlumno ? "Enviar" : "Actualizar Alumno"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
