import 'veiculo.dart';

class Carro extends Veiculo {
  int quilometragemPorAno;
  int numeroDePortas;

  @override
  Carro({
    required super.marca,
    required super.modelo,
    required super.anoDeFabricacao,
    required this.quilometragemPorAno,
    required this.numeroDePortas,
  });

  @override
  void exibirInformacoes() {
    super.exibirInformacoes();
    print("Quilometragem por ano: $quilometragemPorAno");
    print("Número de portas: $numeroDePortas");
    print("Etiqueta (estado carro): ${_estadoCarro(numeroDePortas)}");
    print("Preço final: ${_calcularPrecoFinal(precoBase)}");
  }

  String _estadoCarro(int quilometragemPorAno) {
    if (quilometragemPorAno < 15000) {
      return "seminovo";
    } else if (quilometragemPorAno >= 15000 && quilometragemPorAno <= 20000) {
      return "usado";
    } else {
      return "antigo";
    }
  }

  double _calcularPrecoFinal(double precoBase) {
    return precoBase +
        numeroDePortas * 1000 +
        (DateTime.now().year - anoDeFabricacao) * quilometragemPorAno * 0.01;
  }
}
