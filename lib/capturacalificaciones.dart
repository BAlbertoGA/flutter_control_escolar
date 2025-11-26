import 'package:flutter/material.dart';

class Capturacalificaciones extends StatelessWidget {
  const Capturacalificaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Captura de Calificaciones'),
      ),
      body: const Center(
        child: Text('Aquí se capturan las calificaciones.'),
      ),
    );
  }
}