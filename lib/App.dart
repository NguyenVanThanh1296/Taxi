import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taxi/resourse/login_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        } else {
          return const CircularProgressIndicator();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        // Return loading
      },
    );

  }
}