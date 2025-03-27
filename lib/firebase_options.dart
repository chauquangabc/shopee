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
    apiKey: 'AIzaSyBlBdoPeoBUwMh246bmscj_xLXzSPxEZhg',
    appId: '1:244852423774:web:8b8a476fcdd0fdaec6c8cf',
    messagingSenderId: '244852423774',
    projectId: 'projectshopee-dae66',
    authDomain: 'projectshopee-dae66.firebaseapp.com',
    storageBucket: 'projectshopee-dae66.firebasestorage.app',
    measurementId: 'G-YCS9LYK3VJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz5zFxh4V261_QWMqyrAuY53EOe0ZBIwQ',
    appId: '1:244852423774:android:c08df795677e5912c6c8cf',
    messagingSenderId: '244852423774',
    projectId: 'projectshopee-dae66',
    storageBucket: 'projectshopee-dae66.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDDfEmpDvQBmtqG1uaOSTGEz14LfVrK4ik',
    appId: '1:244852423774:ios:d1dae90181517cf3c6c8cf',
    messagingSenderId: '244852423774',
    projectId: 'projectshopee-dae66',
    storageBucket: 'projectshopee-dae66.firebasestorage.app',
    iosBundleId: 'com.example.shopee',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDDfEmpDvQBmtqG1uaOSTGEz14LfVrK4ik',
    appId: '1:244852423774:ios:d1dae90181517cf3c6c8cf',
    messagingSenderId: '244852423774',
    projectId: 'projectshopee-dae66',
    storageBucket: 'projectshopee-dae66.firebasestorage.app',
    iosBundleId: 'com.example.shopee',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBlBdoPeoBUwMh246bmscj_xLXzSPxEZhg',
    appId: '1:244852423774:web:6e71fd8e14fda256c6c8cf',
    messagingSenderId: '244852423774',
    projectId: 'projectshopee-dae66',
    authDomain: 'projectshopee-dae66.firebaseapp.com',
    storageBucket: 'projectshopee-dae66.firebasestorage.app',
    measurementId: 'G-MRHEJW1Q76',
  );

}