import 'package:flutter/material.dart';
import 'cards.dart';
import 'form.dart';

void main() {
  runApp(GemaApp());
}

class GemaApp extends StatelessWidget {
  const GemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormVehicle(),
      ),
    );
  }
}
