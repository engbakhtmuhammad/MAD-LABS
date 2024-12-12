
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mad/Lab%2010/view/post.dart';

import 'firebase_options.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //  return ChangeNotifierProvider(  // Wrap the app with ChangeNotifierProvider
    //   create: (context) => CounterModel(),
    //   child: MaterialApp(
    //     home: CounterScreen(),
    //   ),
    // );
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FeedScreen(),
      // home: ImplicitAnimationApp(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

