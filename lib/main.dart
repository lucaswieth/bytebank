import 'package:flutter/material.dart';
//import 'package:bytebank/screens/form.dart';
import 'package:bytebank/screens/list.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: VehiclesList(),
      ),
    );
  }
}
