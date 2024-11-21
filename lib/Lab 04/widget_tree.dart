import 'package:flutter/material.dart';

class WidgetTreeScreen extends StatelessWidget {
  const WidgetTreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(title: Text("Complex UI Example")),
  body: Column(
    children: [
      Row(
        children: [
          Icon(Icons.star),
          Text("Rating"),
        ],
      ),
      Row(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Press Me")),
        ],
      ),
    ],
  ),
);

  }
}