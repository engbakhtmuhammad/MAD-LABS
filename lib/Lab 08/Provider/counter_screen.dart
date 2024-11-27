import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_model.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterModel>(  // Consumer listens to the state change
              builder: (context, counterModel, child) {
                return Text(
                  'Counter: ${counterModel.counter}',
                  style: const TextStyle(fontSize: 30),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.read<CounterModel>().incrementCounter();  // Increment counter
              },
              child: const Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}