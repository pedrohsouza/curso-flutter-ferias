// 4. Manipulação de pesos

void main(List<String> args) {
  String pesoBalanca = "75.5";
  double pesoAtual = double.parse(pesoBalanca);

  print('O peso atual é: $pesoAtual Kg');
  print('O peso absoluto é: ${pesoAtual.abs()} Kg');
  print('O peso arredondado é: ${pesoAtual.ceil()} Kg');
}
