import 'package:mad/Lab 05/explicit.dart';
import 'package:flutter/material.dart';
import 'package:mad/Lab%2006/navigation.dart';
import 'package:mad/Lab%2007/api.dart';
import 'package:mad/Lab%2007/future.dart';
import 'package:mad/Lab%2007/stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: NavigationScreen(),
      // home: ImplicitAnimationApp(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

