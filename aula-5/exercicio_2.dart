Stream<int> countDownStream(int max) async* {
  for (int i = max; i > 0; i--) {
    yield i;
    await Future.delayed(Duration(seconds: 1));
  }
}

void main(List<String> args) {
  final Stream<int> countdown = countDownStream(5);

  countdown.listen((number) {
    print(number);
  });
}
