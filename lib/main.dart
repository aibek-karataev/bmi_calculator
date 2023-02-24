import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:const Text("BMI CALCULATOR"),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
