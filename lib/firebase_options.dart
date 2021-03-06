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
    apiKey: 'AIzaSyCCfGrcDlLpj6c01JmcyxF2NbHTUu5ioc4',
    appId: '1:543548624023:web:7ea024355e33f900fa6dd2',
    messagingSenderId: '543548624023',
    projectId: 'food-delivery-76ad7',
    authDomain: 'food-delivery-76ad7.firebaseapp.com',
    storageBucket: 'food-delivery-76ad7.appspot.com',
    measurementId: 'G-V6DPBEMH6D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5o75ZZd2XIAaoBcmIP6sjFnRw4IxxsKg',
    appId: '1:543548624023:android:5b879a880a529e75fa6dd2',
    messagingSenderId: '543548624023',
    projectId: 'food-delivery-76ad7',
    storageBucket: 'food-delivery-76ad7.appspot.com',
  );
}
