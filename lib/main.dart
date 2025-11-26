import 'package:flutter/material.dart';
import 'package:flutter_control_escolar/mylistview.dart';
import 'package:flutter_control_escolar/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Control Escolar",
      home: const MyListView(),
      routes: appRoutes,
    );
  }
}
