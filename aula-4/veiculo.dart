class Veiculo {
  String marca;
  String modelo;
  int anoDeFabricacao;
  double precoBase = 0;

  Veiculo({
    required this.marca,
    required this.modelo,
    required this.anoDeFabricacao,
  });

  void exibirInformacoes() {
    print("Informações do veículo:");
    print("Marca: $marca");
    print("Modelo: $modelo");
    print("Ano de fabricação: $anoDeFabricacao");
  }
}
