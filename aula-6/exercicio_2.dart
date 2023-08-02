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
      title: "Curso Flutter de Verão",
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Minhas Receitas"),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                'Sobremesas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Torta de Maçã'),
                Text('Mousse de Chocolate'),
                Text('Pudim de Leite Condensado'),
              ],
            ),
            Center(
              child: Text(
                'Pratos Principais',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Frango Assado com Batatas'),
                Text('Espaguete à Bolonhesa'),
                Text('Risoto de Cogumelo'),
              ],
            ),
            Center(
              child: Text(
                'Aperitivos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Bolinho de Queijo'),
                Text('Bruschetta de Tomate e Manjericão'),
                Text('Canapés de Salmão com Cream Cheese'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
