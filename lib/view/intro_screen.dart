import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/utils/routes_name.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('${RoutesName.introScreen}')
      ),
    );
  }
}