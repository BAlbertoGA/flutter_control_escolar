import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/drawer.dart';
import 'package:flutter_control_escolar/mylistview.dart';

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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese el ID';
                  }
                  if (int.parse(value) == null) {
                    return 'El ID debe ser numerico';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: crtlNombre, //Agrega el valor de los controllers
                decoration: InputDecoration(label: Text("Nombre")),
                keyboardType: TextInputType.text,
              ),
              TextFormField(
                controller: crtlTelefono, //Agrega el valor de los controllers
                decoration: InputDecoration(label: Text("Telefono")),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  String idAlumno = crtlId.text;
                  String nombreAlumno = crtlNombre.text;
                  String telefonoAlumno = crtlTelefono.text;

                  if (!nuevoAlumno) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Datos Actualizados')),
                    );
                  } else {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Alumno Agregado')));
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
