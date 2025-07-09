import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_c11_online/core/resources/assets_manager.dart';
import '../../core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.signInRoute);
    });
    return Scaffold(
        body: Image.asset(
      ImageAssets.splashScreen,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
