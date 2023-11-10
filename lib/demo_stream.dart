import 'package:flutter/material.dart';

// class DemoStream extends StatefulWidget {
//
//   @override
//   State<DemoStream> createState() => _DemoStreamState();
// }
//
// class _DemoStreamState extends State<DemoStream> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

void main() {
  // 1: Khoi tao bang Future
  final Future<String> futureString = Future.delayed(
      Duration(seconds: 1), () => "Hello");
  Stream<String> streamFuture = Stream.fromFuture(futureString);

  streamFuture.listen((event) { print(event); });
}
