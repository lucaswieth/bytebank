import 'package:flutter/material.dart';
import 'package:bytebank/screens/form.dart';
import 'package:bytebank/screens/list.dart';

void main() {
  runApp(GemaApp());
}

class GemaApp extends StatelessWidget {
  const GemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: VehiclesList(),
      ),
    );
  }
}
