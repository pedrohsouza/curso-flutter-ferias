import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Olá, mundo!",
      home: Scaffold(
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadiusDirectional.circular(4),
            ),
            child: const Center(
              child: Text(
                "Olá, mundo!",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
