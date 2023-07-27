// 3. Estrutura de Repetição - coleções

import 'dart:io';

void main(List<String> args) {
  print("Informe o preço máximo:");

  int precoMaximo = int.parse(stdin.readLineSync() ?? "0");
  List<int> precos = [];

  for (var i = 0; i <= precoMaximo; i += 2) {
    precos.add(i);
  }

  print(precos);
}
