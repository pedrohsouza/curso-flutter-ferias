// 2. Estrutura de Repetição - while

import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  int tentativas = 3, numero = Random().nextInt(10) + 1, palpite = 11;

  print("");
  print("================================================================");
  print("");

  while (palpite != numero && tentativas > 0) {
    print("Digite seu palpite:");
    palpite = int.parse(stdin.readLineSync() ?? "0");

    if ((palpite > numero) && tentativas > 0) {
      tentativas--;
      print("O seu palpite é maior do que o número");
      print("Tentativas restantes: $tentativas");
      print("");
      print("================================================================");
      print("");
    } else if ((palpite < numero) && tentativas > 0) {
      tentativas--;
      print("O seu palpite é menor do que o número");
      print("Tentativas restantes: $tentativas");
      print("");
      print("================================================================");
      print("");
    } else if ((palpite == numero) && tentativas > 0) {
      print("Você acertou o número");
      print("");
      print("================================================================");
      print("");
      tentativas = 0;
    }
  }
}
