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

  final String busca = '';

  runApp(
    MainApp(
      dados: dados,
      categoria: categoria,
      busca: busca,
    ),
  );
}

class MainApp extends StatelessWidget {
  final Map<String, List<String>> dados;
  final int? categoria;
  final String busca;

  const MainApp({
    Key? key,
    required this.dados,
    this.categoria,
    required this.busca,
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
        body: (resultadoBusca() == true || busca == '')
            ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: filtro(),
                ),
              )
            : const Center(
                child: Text("Nenhuma receita encontrada"),
              ),
      ),
    );
  }

  bool ehValida(String receita, String busca) {
    return busca == '' || receita.toLowerCase().contains(busca.toLowerCase());
  }

  bool resultadoBusca() {
    final List<MapEntry<String, List<String>>> entries = dados.entries.toList();

    for (var element in entries) {
      for (var receita in element.value) {
        if (receita.toLowerCase().contains(busca.toLowerCase())) {
          return true;
        }
      }
    }

    return false;
  }

  List<Widget> filtro() {
    final List<MapEntry<String, List<String>>> entries = dados.entries.toList();

    return [
      for (int i = 0; i < entries.length; i++)
        if ((categoria == null || categoria == i + 1) &&
            entries[i].value.any((receita) => ehValida(receita, busca)))
          Flexible(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    entries[i].key,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String receita in entries[i].value)
                      if (ehValida(receita, busca))
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
          ),
    ];
  }
}
