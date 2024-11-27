import 'package:flutter/material.dart';


class SetStateManagementScreen extends StatefulWidget {
  const SetStateManagementScreen({super.key});

  @override
  _SetStateManagementScreenState createState() => _SetStateManagementScreenState();
}

class _SetStateManagementScreenState extends State<SetStateManagementScreen> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App With SetState'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pressed the button this many times:'),
            Text(
              '$counter',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
