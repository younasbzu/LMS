import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'dart:ffi';
import 'package:mybzu/view/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        //name: "com.example.ecommerece",
        options: const FirebaseOptions(
            apiKey: "AIzaSyCMObj4hFYaZZ7JAfgnxUnrRSgqCBNPuHg",
            authDomain: "my-bzu.firebaseapp.com",
            projectId: "my-bzu",
            storageBucket: "my-bzu.appspot.com",
            messagingSenderId: "343975721482",
            appId: "1:343975721482:web:2bf6f1793fb8e3fdb63df3",
            measurementId: "G-310L7VXXSH"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const splash_Screen(),
    );
  }
}
