import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _Estado {
  int count;
  List<String> items;

  _Estado({required this.count, required this.items});
}

class _Bloc extends Cubit<_Estado> {
  _Bloc() : super(_Estado(count: 0, items: []));

  void incrementa() {
    int count = state.count;
    emit(_Estado(count: count + 1, items: state.items));
  }

  void decrementa() {
    int count = state.count;
    emit(_Estado(count: count - 1, items: state.items));
  }

  void adiciona() {
    // como a lista é instaciada por referencia, cria-se uma copia da lista
    // para que o gerenciador de estado consiga comparar as alteracoes de estado
    // entre a lista original e a copia
    List<String> items = state.items.toList();
    items.add('abc');
    emit(_Estado(count: state.count, items: items));
  }
}

class TelaBloc extends StatelessWidget {
  const TelaBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _Bloc(),
      child: BlocBuilder<_Bloc, _Estado>(
        builder: (context, estado) {
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocSelector<_Bloc, _Estado, int>(
                    selector: (state) {
                      return state.count;
                    },
                    builder: (context, count) {
                      return Text('$count');
                    },
                  ),
                  MaterialButton(
                    color: Colors.blue,
                    onPressed: () {
                      _Bloc bloc = context.read<_Bloc>();
                      bloc.incrementa();
                    },
                    child: const Text('adicionar'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
