Future<String> mockNetworkData() async {
  return Future.delayed(const Duration(seconds: 2), () => "从互联网上获取到的数据");
}

Stream<double> StreamCounter() {
  return Stream.periodic(Duration(milliseconds: 50), (i) {
    print(
      'stream api $i',
    );
    return (i % 101) / 100;
  }).take(101);
}
