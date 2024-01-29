import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDhOc4-sq8H3scnETGLblDfmLZJI0Bxzc4",
            authDomain: "fir-flutterflow-7668d.firebaseapp.com",
            projectId: "fir-flutterflow-7668d",
            storageBucket: "fir-flutterflow-7668d.appspot.com",
            messagingSenderId: "856426233437",
            appId: "1:856426233437:web:fbd088e00e060f72bd97b4"));
  } else {
    await Firebase.initializeApp();
  }
}
