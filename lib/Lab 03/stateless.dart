import 'package:flutter/material.dart';

class StatelessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateless Widget Example')),
        body: Center(child: Text('Hello, World!')),
      ),
    );
  }
}
