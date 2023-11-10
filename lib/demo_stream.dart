import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class DemoStream extends StatefulWidget {

  @override
  State<DemoStream> createState() => _DemoStreamState();
}

class _DemoStreamState extends State<DemoStream> {

  StreamController<int> streamController = StreamController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
              initialData: null,
              stream: streamController.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                switch(snapshot.connectionState) {
                  case ConnectionState.none: {
                    return Text("Empty value");
                  }
                  case ConnectionState.waiting: {
                    return Text("Waiting");
                  }
                  case ConnectionState.done: {
                    return Text("Done");
                  }
                  case ConnectionState.active:
                    return Text("Value : ${snapshot.data}");
                }

                return Text("");
              }
          ),
          ElevatedButton(onPressed: () {
              streamController.sink.add(Random().nextInt(100));
          }, child: Text("Random number"))
        ],
      ),
    );
  }
}

// void main() {
// 1: Khoi tao bang Future
// final Future<String> futureString = Future.delayed(
//     Duration(seconds: 1), () => "Hello");
// Stream<String> streamFuture = Stream.fromFuture(futureString);
//
// streamFuture.listen((event) { print(event); });

// 2: Khoi tao bang iterable
// Stream<int> streamIterable = Stream.fromIterable([10, 20, 30, 40, 50]);
//
// streamIterable.listen((event) { print(event); });

// 3: Khoi tao bang periodic
// Stream<int> streamNumber =
//     Stream.periodic(Duration(seconds: 1), (count) => count);
//
// streamNumber.listen((event) {
//   print(event);
// });
//
//   // 4: StreamController
//
//   StreamController<int> streamControllerNumber = StreamController();
//
//   streamControllerNumber.stream.listen((event) {
//     print(event);
//   });
//
//   Future.delayed(Duration(seconds: 1), () {
//     streamControllerNumber.sink.add(10);
//   });
//
//   Future.delayed(Duration(seconds: 2), () {
//     streamControllerNumber.sink.add(20);
//   });
//
//   Future.delayed(Duration(seconds: 3), () {
//     streamControllerNumber.sink.add(30);
//   });
// }
