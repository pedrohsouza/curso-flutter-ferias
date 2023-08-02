import 'package:flutter/material.dart';

void main() {
  final Map<String, List<String>> dados = {
    'Sobremesas': [
      'Torta de Maçã',
      'Mousse de Chocolate',
      'Pudim de Leite Condensado',
    ],
    'Pratos Principais': [
      'Frango Assado com Batatas',
      'Espaguete à Bolonhesa',
      'Risoto de Cogumelo',
    ],
    'Aperitivos': [
      'Bolinho de Queijo',
      'Bruschetta de Tomate e Manjericão',
      'Canapés de Salmão com Cream Cheese',
    ],
  };

  runApp(
    MainApp(dados: dados),
  );
}

class MainApp extends StatelessWidget {
  final Map<String, List<String>> dados;

  const MainApp({super.key, required this.dados});

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            for (var dado in dados.entries)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: Text(
                      dado.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (var receita in dado.value)
                        Text(
                          receita,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
