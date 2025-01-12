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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCi4LR1WpxzuFZqXFUaMvUU_PzUWW6uH9Q',
    appId: '1:641912171529:android:9b904a27aef220706a9cd8',
    messagingSenderId: '641912171529',
    projectId: 'amquick-67955',
    databaseURL: 'https://amquick-67955-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'amquick-67955.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCMwxsMJAtSqYLSW8jRTlT-ssMAqFuZ4r0',
    appId: '1:641912171529:ios:9eb0cd0ca819130c6a9cd8',
    messagingSenderId: '641912171529',
    projectId: 'amquick-67955',
    databaseURL: 'https://amquick-67955-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'amquick-67955.firebasestorage.app',
    iosBundleId: 'com.example.amquickDraft',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDFrOpbv7l31S4q4sBAlNHsueRI8H4fDnI',
    appId: '1:641912171529:web:4849e11e35486c726a9cd8',
    messagingSenderId: '641912171529',
    projectId: 'amquick-67955',
    authDomain: 'amquick-67955.firebaseapp.com',
    databaseURL: 'https://amquick-67955-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'amquick-67955.firebasestorage.app',
    measurementId: 'G-K0LF88F08X',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCMwxsMJAtSqYLSW8jRTlT-ssMAqFuZ4r0',
    appId: '1:641912171529:ios:9eb0cd0ca819130c6a9cd8',
    messagingSenderId: '641912171529',
    projectId: 'amquick-67955',
    databaseURL: 'https://amquick-67955-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'amquick-67955.firebasestorage.app',
    iosBundleId: 'com.example.amquickDraft',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDFrOpbv7l31S4q4sBAlNHsueRI8H4fDnI',
    appId: '1:641912171529:web:9853cf59872e726c6a9cd8',
    messagingSenderId: '641912171529',
    projectId: 'amquick-67955',
    authDomain: 'amquick-67955.firebaseapp.com',
    databaseURL: 'https://amquick-67955-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'amquick-67955.firebasestorage.app',
    measurementId: 'G-7R8W80GQ6S',
  );

}