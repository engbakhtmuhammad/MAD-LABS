import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'counter_controller.dart';

class CounterScreen extends StatelessWidget {
  // Create an instance of the CounterController
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(  // Use Obx to reactively update UI
              'Counter: ${controller.counter.value}',  // .value accesses the observable variable
              style: const TextStyle(fontSize: 30),
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.incrementCounter,
              child: const Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}