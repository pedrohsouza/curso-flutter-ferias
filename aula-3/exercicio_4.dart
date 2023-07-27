// 4. Funções em Dart

import 'dart:io';

void main(List<String> args) {
  List<double> notas = [];
  int quantidadeAvaliacoes = 1;

  print("Informe a quantidade de avaliações:");
  quantidadeAvaliacoes = int.parse(stdin.readLineSync() ?? "1");

  for (var i = 1; i <= quantidadeAvaliacoes; i++) {
    print("Informe a nota da $iª avaliação");
    notas.add(double.parse(stdin.readLineSync() ?? "0"));
  }

  print("Média das avaliações: ${calcularMedia(notas: notas)}");
}

double calcularMedia({required List<double> notas}) {
  double soma = 0;

  for (var nota in notas) {
    soma += nota;
  }

  return soma / notas.length;
}
