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
    apiKey: 'AIzaSyC0S-qdXzpZsrWRTIoC3WPCoHOKf0D7yD8',
    appId: '1:569555461779:web:1e94d947c898024934cf66',
    messagingSenderId: '569555461779',
    projectId: 'fitness-878bd',
    authDomain: 'fitness-878bd.firebaseapp.com',
    storageBucket: 'fitness-878bd.appspot.com',
    measurementId: 'G-5H9SHDS6PD',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbCo5t1yDYiq1fEbHmReEIQCi-7-K-c18',
    appId: '1:569555461779:ios:a074306bde15720234cf66',
    messagingSenderId: '569555461779',
    projectId: 'fitness-878bd',
    storageBucket: 'fitness-878bd.appspot.com',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAbCo5t1yDYiq1fEbHmReEIQCi-7-K-c18',
    appId: '1:569555461779:ios:a074306bde15720234cf66',
    messagingSenderId: '569555461779',
    projectId: 'fitness-878bd',
    storageBucket: 'fitness-878bd.appspot.com',
    iosBundleId: 'com.example.fitnessApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC0S-qdXzpZsrWRTIoC3WPCoHOKf0D7yD8',
    appId: '1:569555461779:web:2bb9a2e5918c15b134cf66',
    messagingSenderId: '569555461779',
    projectId: 'fitness-878bd',
    authDomain: 'fitness-878bd.firebaseapp.com',
    storageBucket: 'fitness-878bd.appspot.com',
    measurementId: 'G-L71K43YYC1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAieVRk14Niepm3W-zCPB9q2rZq1BzYycs',
    appId: '1:569555461779:android:9c647fe215d4ab2734cf66',
    messagingSenderId: '569555461779',
    projectId: 'fitness-878bd',
    storageBucket: 'fitness-878bd.appspot.com',
  );

}