import 'carro.dart';
import 'moto.dart';
import 'veiculo.dart';

void main(List<String> args) {
  // Exercício 1

  print('');
  print('========================');
  print('');

  Veiculo carro1 = Veiculo(
    marca: "Fiat",
    modelo: "Uno",
    anoDeFabricacao: 2013,
  );

  carro1.exibirInformacoes();

  print('');
  print('========================');
  print('');

  // Exercício 2

  Carro carro2 = Carro(
    marca: "Toyota",
    modelo: "Etios",
    anoDeFabricacao: 2013,
    quilometragemPorAno: 80,
    numeroDePortas: 4,
  );

  carro2.precoBase = 20000;

  carro2.exibirInformacoes();

  print('');
  print('========================');
  print('');

  Moto moto = Moto(
    marca: "Honda",
    modelo: "Não sei",
    anoDeFabricacao: 2017,
    numeroDeCilindradas: 8,
    temPartidaEletrica: true,
  );

  moto.precoBase = 10000;

  moto.exibirInformacoes();

  print('');
  print('========================');
  print('');
}
