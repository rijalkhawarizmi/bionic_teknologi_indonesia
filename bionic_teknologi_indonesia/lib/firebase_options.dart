import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.android:
        return android;
      default:
        return web;
    }
  }

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: 'YOUR_IOS_MESSAGING_SENDER_ID',
    projectId: 'YOUR_IOS_PROJECT_ID',
    authDomain: 'YOUR_IOS_AUTH_DOMAIN',
    storageBucket: 'YOUR_IOS_STORAGE_BUCKET',
    iosBundleId: 'YOUR_IOS_BUNDLE_ID',
    iosClientId: 'YOUR_IOS_CLIENT_ID',
    databaseURL: 'YOUR_IOS_DATABASE_URL',
    measurementId: 'YOUR_IOS_MEASUREMENT_ID',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsN4D5Enr7sUCkoRSFtEVh78ezmBEngEc',
    appId: '1:111767241329:android:84d6c0ded1349ba87391d0',
    messagingSenderId: 'YOUR_ANDROID_MESSAGING_SENDER_ID',
    projectId: 'YOUR_ANDROID_PROJECT_ID',
    authDomain: 'YOUR_ANDROID_AUTH_DOMAIN',
    storageBucket: 'YOUR_ANDROID_STORAGE_BUCKET',
    androidClientId: 'YOUR_ANDROID_CLIENT_ID',
    databaseURL: 'YOUR_ANDROID_DATABASE_URL',
    measurementId: 'YOUR_ANDROID_MEASUREMENT_ID',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'YOUR_WEB_API_KEY',
    appId: 'YOUR_WEB_APP_ID',
    messagingSenderId: 'YOUR_WEB_MESSAGING_SENDER_ID',
    projectId: 'YOUR_WEB_PROJECT_ID',
    authDomain: 'YOUR_WEB_AUTH_DOMAIN',
    storageBucket: 'YOUR_WEB_STORAGE_BUCKET',
    databaseURL: 'YOUR_WEB_DATABASE_URL',
    measurementId: 'YOUR_WEB_MEASUREMENT_ID',
  );

}
