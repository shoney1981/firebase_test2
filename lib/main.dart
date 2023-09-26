import 'package:firebase_test/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';







void main() async{

// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await Firebase.initializeApp(
//   //   // Replace with actual values
//   //   options: const FirebaseOptions(
//   //     apiKey: 'AIzaSyB8AdN8HioMn2V4v90OxZdoebgTCUnwHZM',
//   //     appId: "716300943335",
//   //     messagingSenderId: "XXX",
//   //     projectId: "flash-chat-honey",
//   //   ),
//   // );
//   runApp(const MyApp());
// }



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
theme: ThemeData(
  primarySwatch: Colors.deepOrange,
),
      home: SplashScreen(),
    );
  }
}
