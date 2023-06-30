import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
class DefaultFirebaseOptions{
   static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
      
    }switch (defaultTargetPlatform) {
     
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
    apiKey: 'AIzaSyAe2Du1MdYls4HIrzifkZbGnzrhVTIliMs',
    appId: '1:108186975857:web:c27ca939cdffa76707a5d0',
    messagingSenderId: '108186975857',
    projectId: 'chat-28508',
    authDomain: 'chat-28508.firebaseapp.com',
    storageBucket: 'chat-28508.appspot.com',
    measurementId: 'G-W2MRT064QJ',
  );
}