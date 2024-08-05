
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/utils/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), ()=>Navigator.pushNamed(context, RoutesName.homeScreen));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/Logo.png'),
      )
    );
  }
}