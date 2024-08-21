import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movies/config/routes/routes.dart';
import 'package:movies/constants/colors_cons.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  void _startDelay() {
    _timer = Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, Routes.homeScreen);
    });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCons.backGroundColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 100),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset('assets/images/splash.jpg'),
        ),
      ),
    );
  }
}
