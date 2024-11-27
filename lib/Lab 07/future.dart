import 'package:flutter/material.dart';

class FutureFetchScreen extends StatelessWidget {
  const FutureFetchScreen({super.key});

  Future<String> fetchData() async {
    return "Data fetched successfully!";
  }

  Future<void> fetchAndPrintData() async {
    print("Fetching data...");
    await Future.delayed(Duration(seconds: 2)); // Simulating a delay
    print("Data fetched!");
  }

  Future<String> simulateDelay() async {
    print(">>>>>>>>>>>>>>>>>>>>>Starting task...");
    await Future.delayed(Duration(seconds: 3));
    print(">>>>>>>>>>>>>>>>>>>>>>Task completed after delay!");
    return "Task completed after delay!";
  }

  Future<void> fetchWithErrorHandling() async {
    try {
      await Future.delayed(Duration(seconds: 2));
      throw Exception("An error occurred during the operation");
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: simulateDelay(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show a loading spinner
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              return Text("Result: ${snapshot.data}");
            }
          },
        ),
      ),
    );
  }
}
