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
    apiKey: 'AIzaSyCLy-l85LOFqkbeb5WPsdvQg3PIyMwZF3Y',
    appId: '1:163027133120:web:8182e5a149ce72a083c325',
    messagingSenderId: '163027133120',
    projectId: 'notification-9f098',
    authDomain: 'notification-9f098.firebaseapp.com',
    storageBucket: 'notification-9f098.firebasestorage.app',
    measurementId: 'G-K2VS6E6N2L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD5gFVVrieRafIfQumj-zrxs8UJpThHd8I',
    appId: '1:163027133120:android:ded7c91a2d09913583c325',
    messagingSenderId: '163027133120',
    projectId: 'notification-9f098',
    storageBucket: 'notification-9f098.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCeBwjOIDqFuRSst-KB1wo7OTX5DXp5SM4',
    appId: '1:163027133120:ios:817aab94389d4b1b83c325',
    messagingSenderId: '163027133120',
    projectId: 'notification-9f098',
    storageBucket: 'notification-9f098.firebasestorage.app',
    iosBundleId: 'com.example.notif',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCeBwjOIDqFuRSst-KB1wo7OTX5DXp5SM4',
    appId: '1:163027133120:ios:817aab94389d4b1b83c325',
    messagingSenderId: '163027133120',
    projectId: 'notification-9f098',
    storageBucket: 'notification-9f098.firebasestorage.app',
    iosBundleId: 'com.example.notif',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCLy-l85LOFqkbeb5WPsdvQg3PIyMwZF3Y',
    appId: '1:163027133120:web:851fe573cc73eeba83c325',
    messagingSenderId: '163027133120',
    projectId: 'notification-9f098',
    authDomain: 'notification-9f098.firebaseapp.com',
    storageBucket: 'notification-9f098.firebasestorage.app',
    measurementId: 'G-RK86KH3NX1',
  );
}