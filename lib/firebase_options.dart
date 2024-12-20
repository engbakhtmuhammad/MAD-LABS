// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCKBqJk9q43_TRPgCH7SwOPRh-K35VxRnU',
    appId: '1:225162728183:web:ddb33f6a4a13167fdff9f2',
    messagingSenderId: '225162728183',
    projectId: 'symptoms-checker-83e0a',
    authDomain: 'symptoms-checker-83e0a.firebaseapp.com',
    databaseURL: 'https://symptoms-checker-83e0a-default-rtdb.firebaseio.com',
    storageBucket: 'symptoms-checker-83e0a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCO1rzM4yZiLtUtIk4GLTysRwJuLOZ5g5I',
    appId: '1:225162728183:android:ee5e1d3d44ac1d54dff9f2',
    messagingSenderId: '225162728183',
    projectId: 'symptoms-checker-83e0a',
    databaseURL: 'https://symptoms-checker-83e0a-default-rtdb.firebaseio.com',
    storageBucket: 'symptoms-checker-83e0a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAnkxRsGapP3gML4-PtRE1PZJOm-tKcPGo',
    appId: '1:225162728183:ios:7ae26b950257ccfcdff9f2',
    messagingSenderId: '225162728183',
    projectId: 'symptoms-checker-83e0a',
    databaseURL: 'https://symptoms-checker-83e0a-default-rtdb.firebaseio.com',
    storageBucket: 'symptoms-checker-83e0a.appspot.com',
    androidClientId: '225162728183-cnl24fq0g2mapubv0umusgv5376gpn8n.apps.googleusercontent.com',
    iosBundleId: 'com.example.mad',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAnkxRsGapP3gML4-PtRE1PZJOm-tKcPGo',
    appId: '1:225162728183:ios:7ae26b950257ccfcdff9f2',
    messagingSenderId: '225162728183',
    projectId: 'symptoms-checker-83e0a',
    databaseURL: 'https://symptoms-checker-83e0a-default-rtdb.firebaseio.com',
    storageBucket: 'symptoms-checker-83e0a.appspot.com',
    androidClientId: '225162728183-cnl24fq0g2mapubv0umusgv5376gpn8n.apps.googleusercontent.com',
    iosBundleId: 'com.example.mad',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCKBqJk9q43_TRPgCH7SwOPRh-K35VxRnU',
    appId: '1:225162728183:web:5b580ce35b2f499adff9f2',
    messagingSenderId: '225162728183',
    projectId: 'symptoms-checker-83e0a',
    authDomain: 'symptoms-checker-83e0a.firebaseapp.com',
    databaseURL: 'https://symptoms-checker-83e0a-default-rtdb.firebaseio.com',
    storageBucket: 'symptoms-checker-83e0a.appspot.com',
  );
}
