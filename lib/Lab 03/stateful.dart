import 'package:flutter/material.dart';

class StatefulScreen extends StatefulWidget {
  @override
  _StatefulScreenState createState() => _StatefulScreenState();
}

class _StatefulScreenState extends State<StatefulScreen> {
  int counter = 0;
  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateful Widget Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Button tapped $counter times'),
              ElevatedButton(
                onPressed: incrementCounter,
                child: Text('Tap me!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
