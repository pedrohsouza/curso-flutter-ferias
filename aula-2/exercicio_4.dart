// 4. Estruturas de Condição - if e else

import 'dart:io';

void main(List<String> args) {
  int idade = 25;

  print("Informe sua idade:");
  idade = int.parse(stdin.readLineSync() ?? "1");

  if (idade >= 18) {
    print("Você é maior de idade");
  } else {
    print("Você é menor de idade");
  }
}
