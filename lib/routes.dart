import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/detalleAlumno.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    "/rutadetallealumno":(contest){
      final id = ModalRoute.of(contest)!.settings.arguments as int;
      return Detallealumno(id: id);
    },
  };
}
