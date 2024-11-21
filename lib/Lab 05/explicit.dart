import 'package:flutter/material.dart';


class ExplicitAnimationApp extends StatefulWidget {
  const ExplicitAnimationApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ExplicitAnimationAppState createState() => _ExplicitAnimationAppState();
}

class _ExplicitAnimationAppState extends State<ExplicitAnimationApp>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 100, end: 200).animate(_controller);
    _opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Explicit Animation Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    width: _animation.value,
                    height: _animation.value,
                    color: Colors.blue.withOpacity(_opacityAnimation.value),
                    child: const Center(child: Text('Animating Box')),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_controller.status == AnimationStatus.completed) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: const Text('Start Animation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
