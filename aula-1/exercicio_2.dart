// 2. Manipulação de redações

void main(List<String> args) {
  String redacao =
      "Nas férias participei do mais melhor curso de Flutter do Brasil";

  print('Redação: $redacao');

  print(
      "Assunto: A redação ${redacao.contains('férias') ? '' : 'não '}fala sobre férias");

  print('Número de palavras: ${redacao.split(' ').length}');

  if (redacao.contains('mais melhor')) {
    print("Redação corrigida: ${redacao.replaceAll('mais melhor', 'melhor')}");
  }
}
