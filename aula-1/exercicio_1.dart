void main() {
  // 1. Exibição de alunos

  String nome = "Pedro Souza";
  int idade = 27;
  bool ehNovato = false;
  double peso = 57;

  Map<String, List<double>> notas = {
    "AOC": [7.0, 8.0, 5.0, 6.0],
    "Eletromag": [3.0, 4.0, 5.0, 2.0],
  };

  List<String> disciplinas = ["AOC", "Eletromag"];

  String? endereco;

  print("Informacões do aluno:");
  print("Nome: $nome");
  print("Idade: $idade anos");
  print("Novato: ${ehNovato ? 'Sim' : 'Não'}");
  print("Peso: $peso Kg");

  print("Disciplinas:");
  for (int i = 0; i < disciplinas.length; i++) {
    print("  ${disciplinas[i]}");
  }

  print("Notas:");
  notas.forEach((k, v) => print('  $k: $v'));

  print('');
  print('========================');
  print('');

  // 3. Manipulação de notas

  notas.forEach(
    (key, value) {
      notas[key]?.add(10);
    },
  );

  print("Notas:");
  notas.forEach((k, v) => print('  $k: $v'));
  print('');

  notas.forEach(
    (key, value) {
      notas[key]?.removeAt(2);
    },
  );

  print("Notas sem terceira avaliação:");
  notas.forEach((k, v) => print('  $k: $v'));
  print('');

  Map<String, List<double>> notas1Semestre;

  notas1Semestre = notas.map((key, value) {
    return MapEntry(key, value.sublist(0, 2));
  });

  print("Notas do primeiro semestre:");
  notas1Semestre.forEach((k, v) => print('  $k: $v'));
  print('');

  notas.forEach((key, value) {
    if (notas[key]!.contains(11)) {
      notas[key]!.remove(11);
    }
  });

  print("Notas com erro removido:");
  notas.forEach((k, v) => print('  $k: $v'));
  print('');

  print("Notas em ordem crescente:");
  var notasOrdenadas = notas;
  notasOrdenadas.forEach((key, value) {
    notasOrdenadas[key]?.sort();
  });
  notasOrdenadas.forEach((k, v) => print('  $k: $v'));
  print('');

  print('');
  print('========================');
  print('');

  // 5. Mais manipulação de pesos

  Map<String, double> pesos = {};
  double pesoNovo;

  pesos["Carol"] = 58;
  print(pesos);

  pesos[nome] = peso;
  print(pesos);

  for (int i = 0; i < 3; i++) {
    pesos["Aluno$i"] = pesos["Carol"]! + i;
  }
  print(pesos);

  pesoNovo = pesos["Aluno2"]!;
  print(pesoNovo);

  pesos.remove("Carol");
  print(pesos);

  print(
      "${pesos.containsKey('Pedro') ? 'E' : 'Não e'}xiste um aluno com o nome correspondente");
}
