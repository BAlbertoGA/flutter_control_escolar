import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/altaalumno.dart';
import 'package:flutter_control_escolar/capturacalificaciones.dart';
import 'package:flutter_control_escolar/detalleAlumno.dart';
import 'package:flutter_control_escolar/materias.dart';
import 'package:flutter_control_escolar/mylistview.dart';

class AppRoutes {
  static const String rutaDetalleAlumno = "/rutadetallealumno";
  static const String rutaCapturaCalificaciones = "/rutacapturacalificaciones";
  static const String rutaListaAlumnos = "/rutalistaalumnos";
  static const String rutaMaterias = "/rutaMaterias";
  static const String rutaAltaAlumno = "/rutaAltaAlumno";


  static Map<String, Widget Function(BuildContext)> get appRoutes {
    return {
      rutaDetalleAlumno: (context) {
        final id = ModalRoute.of(context)!.settings.arguments as int;
        return Detallealumno(id: id);
      },

      rutaCapturaCalificaciones: (context) {
        return const Capturacalificaciones();
      },

      rutaListaAlumnos: (context) {
        return MyListView();
      },

      rutaMaterias: (context) {
        return const MyMaterias();
      },

      rutaAltaAlumno: (context) {
        return const AltaAlumno();
      },
    };
  }
}
