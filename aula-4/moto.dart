import 'veiculo.dart';

class Moto extends Veiculo {
  int numeroDeCilindradas;
  bool temPartidaEletrica;

  @override
  Moto({
    required super.marca,
    required super.modelo,
    required super.anoDeFabricacao,
    required this.numeroDeCilindradas,
    required this.temPartidaEletrica,
  });

  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print("Número de cilindradas: $numeroDeCilindradas");
    print("Tem partida elétrica: $temPartidaEletrica");
    print(
        "Etiqueta (categoria da moto): ${_categoriaMoto(numeroDeCilindradas)}");
    print("Preço final: ${_calcularPrecoFinal(precoBase)}");
  }

  String _categoriaMoto(int numeroDeCilindradas) {
    if (numeroDeCilindradas < 125) {
      return "leve";
    } else if (numeroDeCilindradas >= 125 && numeroDeCilindradas <= 500) {
      return "normal";
    } else {
      return "esportiva";
    }
  }

  double _calcularPrecoFinal(double precoBase) {
    return precoBase +
        (temPartidaEletrica ? 500 : 0) +
        numeroDeCilindradas * 0.05;
  }
}
