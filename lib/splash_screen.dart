import 'dart:async';

import 'package:flutter/material.dart';

import 'login_page.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() =>
      _SplashScreenState();
}

class _SplashScreenState
    extends State<SplashScreen> {

  @override
  void initState() {

    super.initState();

    Timer(

      const Duration(
          seconds: 3),

          () {

        Navigator.pushReplacement(

          context,

          MaterialPageRoute(

            builder:
                (_) =>
            const LoginPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Image.asset(
              "assets/images/logo.jpg",
              width: 180,
            ),

            const SizedBox(
              height: 20,
            ),

            const Text(
              "Easy Buy",
              style: TextStyle(
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}