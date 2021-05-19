import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './app_screens/welcomeScreen.dart';
void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "THE LAPTOP HUB",
        home: AnimatedSplashScreen(
          splashIconSize: 400.0,
          splash: Image.asset('./images/laptop_animation.gif'),
          splashTransition: SplashTransition.rotationTransition,
          duration: 5000,
          backgroundColor: Colors.white,
          nextScreen: WelcomeScreen(),
        ),

      ),
  );

}








