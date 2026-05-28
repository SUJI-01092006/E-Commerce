import 'package:flutter/material.dart';
import 'package:bot_toast/bot_toast.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      builder: BotToastInit(),

      navigatorObservers: [
        BotToastNavigatorObserver(),
      ],

      home: const SplashScreen(),
    );
  }
}