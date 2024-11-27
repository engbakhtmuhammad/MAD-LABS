
// ChangeNotifier class to manage state
import 'package:flutter/material.dart';

class CounterModel with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners(); // Notifies listeners that the state has changed
  }
}