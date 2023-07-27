// 2. Operadores de Comparação

import 'dart:io';

void main(List<String> args) {
  int valor;

  print("Digite um número:");
  valor = int.parse(stdin.readLineSync() ?? "1");

  if (valor % 2 == 0) {
    print("O número $valor é par");
  } else {
    print("O número $valor é ímpar");
  }
}
