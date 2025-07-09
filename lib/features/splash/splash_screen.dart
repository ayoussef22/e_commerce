import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/core/resources/assets_manager.dart';
import '../../core/routes_manager/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.signInRoute);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.asset(
      ImageAssets.splashScreen,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
