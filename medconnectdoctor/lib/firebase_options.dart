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
    apiKey: 'AIzaSyCMf32s-hOzcXvqzKnyzji4OF2pAXrbX0s',
    appId: '1:437282685081:web:d1ea0d0feb84a139e5f808',
    messagingSenderId: '437282685081',
    projectId: 'medconnect-2f4b8',
    authDomain: 'medconnect-2f4b8.firebaseapp.com',
    storageBucket: 'medconnect-2f4b8.appspot.com',
    measurementId: 'G-3Q3XQZGWN0',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAEjpgMK2AZYoKUHk7rYCpFgzdORyzcJW8',
    appId: '1:437282685081:android:d25986b76573eb3ce5f808',
    messagingSenderId: '437282685081',
    projectId: 'medconnect-2f4b8',
    storageBucket: 'medconnect-2f4b8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCxkriZr35UDEWnM5-seoGHSA2zi-ZaPU4',
    appId: '1:437282685081:ios:22e5a13e9d2945e8e5f808',
    messagingSenderId: '437282685081',
    projectId: 'medconnect-2f4b8',
    storageBucket: 'medconnect-2f4b8.appspot.com',
    iosBundleId: 'com.example.medconnectdoctor',
  );
}
