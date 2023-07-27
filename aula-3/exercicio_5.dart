// 5. Lambdas em Dart

import 'dart:io';

void main(List<String> args) {
  double desconto = 30;

  var valorComDesconto = (double valorOriginal) =>
      valorOriginal - (valorOriginal * desconto / 100);

  print("Informe o valor do produto:");
  double valorOriginal = double.parse(stdin.readLineSync() ?? "1");

  print(
      "Valor do produto com desconto de $desconto%: ${valorComDesconto(valorOriginal)}");
}
