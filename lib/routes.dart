import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/capturacalificaciones.dart';
import 'package:flutter_control_escolar/detalleAlumno.dart';
import 'package:flutter_control_escolar/materias.dart';
import 'package:flutter_control_escolar/mylistview.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    "/rutadetallealumno": (context) {
      final id = ModalRoute.of(context)!.settings.arguments as int;
      return Detallealumno(id: id);
    },

    "/rutacapturacalificaciones": (context) {
      return const Capturacalificaciones();
    },

    "/rutalistaalumnos": (context) {
      return MyListView();
    },

    "/rutaMaterias": (context) {
      return const MyMaterias();
    },
  };
}
