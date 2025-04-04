import 'package:edconnex/firebase_options.dart';
import 'package:edconnex/login_pages/login_page1.dart';
import 'package:edconnex/login_pages/login_page2.dart';
import 'package:edconnex/login_pages/login_page3.dart';
import 'package:edconnex/main/main_page/main_page.dart';
import 'package:edconnex/signin/homescreen.dart';
import 'package:edconnex/signin/sign_up.dart';
import 'package:edconnex/signin/sign_up2..dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:edconnex/Firebase/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:edconnex/phase3/profilepagecode.dart';

Future<void> main() async {
  // Ensure that plugin services are initialized
  WidgetsFlutterBinding.ensureInitialized(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  // Initialize Firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Set the system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const LoginScreenOne(), // Adjust this to your actual login screen
    );
  }
}
