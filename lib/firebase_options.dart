// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show Firebase, FirebaseOptions;
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;


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
    apiKey: 'AIzaSyCd_FP1bHrm4WmYjZBDt0UJrr9r1X9KOG8',
    appId: '1:987295841474:web:bbe54af61e41ecd2868f5b',
    messagingSenderId: '987295841474',
    projectId: 'tcc-personal-app',
    authDomain: 'tcc-personal-app.firebaseapp.com',
    storageBucket: 'tcc-personal-app.appspot.com',
    measurementId: 'G-55KE7F1J47',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCFb6ToOzm5SZrSVqNXOYPrgyg3aZc_Sl4',
    appId: '1:987295841474:android:dae5b2f43b4a3259868f5b',
    messagingSenderId: '987295841474',
    projectId: 'tcc-personal-app',
    storageBucket: 'tcc-personal-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsVj3J3PHLigW_LD7oZNqiR0Q9Ad4Dc1M',
    appId: '1:987295841474:ios:e9afb39ee6491d6e868f5b',
    messagingSenderId: '987295841474',
    projectId: 'tcc-personal-app',
    storageBucket: 'tcc-personal-app.appspot.com',
    iosClientId:
        '987295841474-o5fc3qsuqvkfoqe4f7kjejr11opcmjl2.apps.googleusercontent.com',
    iosBundleId: 'com.example.personalApp',
  );
}
