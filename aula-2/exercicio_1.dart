// 1. Operadores Aritméticos

import 'dart:io';

void main() {
  int valor1, valor2;

  print("Digite o primeiro número:");
  valor1 = int.parse(stdin.readLineSync() ?? "0");

  print("Digite o segundo número:");
  valor2 = int.parse(stdin.readLineSync() ?? "0");

  print("");

  print("Soma:");
  print(" $valor1 + $valor2 = ${valor1 + valor2}");
  print("Subtração:");
  print(" $valor1 - $valor2 = ${valor1 - valor2}");
  print("Multiplicação:");
  print(" $valor1 * $valor2 = ${valor1 * valor2}");
  print("Divisão:");
  print(" $valor1 / $valor2 = ${valor1 / valor2}");
  print("Resto da divisão:");
  print(" $valor1 % $valor2 = ${valor1 % valor2}");
}
