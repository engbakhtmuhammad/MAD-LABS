import 'package:flutter/material.dart';

class ImplicitAnimationApp extends StatefulWidget {
  @override
  _ImplicitAnimationAppState createState() => _ImplicitAnimationAppState();
}

class _ImplicitAnimationAppState extends State<ImplicitAnimationApp> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Implicit Animation Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedContainer(
                width: _isExpanded ? 200 : 100,
                height: _isExpanded ? 200 : 100,
                color: _isExpanded ? Colors.blue : Colors.red,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: const Center(child: Text('Tap Me')),
              ),
              const SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _isExpanded ? 1.0 : 0.5,
                duration: const Duration(seconds: 1),
                child: const Text(
                  'I am Animated!',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: const Text('Animate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
