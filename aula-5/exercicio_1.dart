Future<String> fetchData() {
  return Future.delayed(Duration(seconds: 3), () {
    return 'Dados obtidos';
  });
}

void main(List<String> args) async {
  final data = await fetchData();

  print(data);
}
