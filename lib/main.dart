import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagramapp/responsive/mobile_screen_layout.dart';
import 'package:instagramapp/responsive/responsive_layout_screen.dart';
import 'package:instagramapp/responsive/web_screen_layout.dart';
import 'package:instagramapp/screens/login_screen.dart';
import 'package:instagramapp/screens/signup_screen.dart';
import 'package:instagramapp/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid ?await Firebase.initializeApp(options: FirebaseOptions(apiKey: "AIzaSyATmPZiphoN_dtV4aK6ISGsrLegSn35b6Q", appId: "1:920278341561:android:21b575dbca8ece9c6a8868", messagingSenderId: "920278341561", projectId: "instagramapp-d3abb")):
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagramapp',
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
     home:const SignupScreen(),
     // home:const ResponsiveLayout(webScreenLayout:WebScreenLayout() ,mobileScreenLayout:MobileScreenLayout() ,),
    );
  }
}
