// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAOV7YtwJsEqVoba1pIQNaz-f-U2Mj6_og',
    appId: '1:718594892633:web:3a826ca33d867fcd736248',
    messagingSenderId: '718594892633',
    projectId: 'appoment-8f089',
    authDomain: 'appoment-8f089.firebaseapp.com',
    storageBucket: 'appoment-8f089.appspot.com',
    measurementId: 'G-2SFDJN9HG6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAg9ZatRxc2BVZ4ytduyCKnXZ6w-k95LLU',
    appId: '1:718594892633:android:e407c0873962e7c5736248',
    messagingSenderId: '718594892633',
    projectId: 'appoment-8f089',
    storageBucket: 'appoment-8f089.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBKwR5oT7PY8cE3Gudp6Pgpfj0nT9CTYCc',
    appId: '1:718594892633:ios:b292604b07c02b03736248',
    messagingSenderId: '718594892633',
    projectId: 'appoment-8f089',
    storageBucket: 'appoment-8f089.appspot.com',
    iosClientId: '718594892633-pfjdjgb7k85hp9oiogcgg89m49sb6qg2.apps.googleusercontent.com',
    iosBundleId: 'com.appoment.appoment',
  );
}