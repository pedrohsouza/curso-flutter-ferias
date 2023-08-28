import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const Tela());
}

class _Estado extends ChangeNotifier {
  int count = 0;
  List<int> numeros = [];

  void incrementa() {
    count += 1;
    notifyListeners();
  }

  void decrementa() {
    count -= 1;
    notifyListeners();
  }

  void adicionarNumeros({required numero}) {
    numeros.add(numero);
    notifyListeners();
  }
}

class Tela extends StatelessWidget {
  const Tela({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _Estado(),
      builder: (context, child) {
        // _Estado estado = context.read<_Estado>(); // lê o estado e pode fazer alterações no estado
        _Estado estado =
            context.watch<_Estado>(); // lê o estado e observa por mudanças
        return MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                MaterialButton(
                  child: Text('${estado.count}'),
                  onPressed: () async {
                    estado.incrementa();
                  },
                ),
                TextField(),
                MaterialButton(
                  child: const Text('adicionar número'),
                  onPressed: () async {
                    estado.adicionarNumeros(numero: 1);
                  },
                ),
                Expanded(
                  child: Center(
                    child: ListView(
                      children: [
                        for (int numero in estado.numeros) Text('$numero')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// class Tela extends StatefulWidget {
//   const Tela({super.key});

//   @override
//   State<Tela> createState() => _TelaState();
// }

// class _TelaState extends State<Tela> {
//   int _count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: MaterialButton(
//           child: Text('$_count'),
//           onPressed: () async {
//             setState(() => _count += 1);
//           },
//         ),
//       ),
//     );
//   }
// }


