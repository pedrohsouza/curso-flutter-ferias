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

  final int? categoria = null;

  runApp(
    MainApp(
      dados: dados,
      categoria: categoria != null ? categoria - 1 : categoria,
    ),
  );
}

class MainApp extends StatelessWidget {
  final Map<String, List<String>> dados;
  final int? categoria;

  const MainApp({
    Key? key,
    required this.dados,
    this.categoria,
  }) : super(key: key);

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
          children: filtro(),
        ),
      ),
    );
  }

  List<Widget> filtro() {
    if (categoria != null) {
      var dado = dados.entries.toList();
      return [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                dado[categoria!].key,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                for (var receita in dado[categoria!].value)
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
      ];
    } else {
      return [
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
      ];
    }
  }
}
