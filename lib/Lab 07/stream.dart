import 'package:flutter/material.dart';

class StreamFetchScreen extends StatelessWidget {
  const StreamFetchScreen({super.key});

  Stream<int> numberStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: StreamBuilder<int>(
        stream: numberStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          return Text("Number: ${snapshot.data}");
        },
      )),
    );
  }
}
