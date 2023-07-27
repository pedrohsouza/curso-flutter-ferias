// 5. Estruturas de Condição - switch-case

import 'dart:io';

void main(List<String> args) {
  int diaNumero = 1;
  String dia;

  print("Digite um número:");
  diaNumero = int.parse(stdin.readLineSync() ?? "0");

  switch (diaNumero) {
    case 1:
      {
        dia = "segunda-feira";
      }
      break;

    case 2:
      {
        dia = "terça-feira";
      }
      break;

    case 3:
      {
        dia = "quarta-feira";
      }
      break;

    case 4:
      {
        dia = "quinta-feira";
      }
      break;

    case 5:
      {
        dia = "sexta-feira";
      }
      break;

    case 6:
      {
        dia = "sábado";
      }
      break;

    default:
      {
        dia = "domingo";
      }
      break;
  }

  print("Hoje é $dia");
}
