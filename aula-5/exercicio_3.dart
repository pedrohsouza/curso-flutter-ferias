Future<int> delayedNumber() async {
  await Future.delayed(const Duration(seconds: 2));
  return 2;
}

Future<String> delayedString() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'result';
}

Future<bool> delayedBool() async {
  await Future.delayed(const Duration(seconds: 2));
  return true;
}

void main(List<String> args) async {
  final value =
      await Future.wait([delayedNumber(), delayedString(), delayedBool()]);
  print(value);
}
