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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDsi2i-V91bw_4yYSVNGbkdV9KjejGa6eY',
    appId: '1:39793981073:web:e07f252cdb0513758ef130',
    messagingSenderId: '39793981073',
    projectId: 'ees121-47d74',
    authDomain: 'ees121-47d74.firebaseapp.com',
    storageBucket: 'ees121-47d74.appspot.com',
    measurementId: 'G-RML24DDFKR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAD6rt51scU9iJcjt3TZnTKBitRiEDsdbw',
    appId: '1:39793981073:android:0cbad2aa810652538ef130',
    messagingSenderId: '39793981073',
    projectId: 'ees121-47d74',
    storageBucket: 'ees121-47d74.appspot.com',
  );
}