import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/notifiyr.dart/category_change_notifier.dart';
import 'package:fluttermidhackathon/view/category_screen.dart';
import 'package:fluttermidhackathon/view/details_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttermidhackathon/utils/navigation.dart';
import 'package:fluttermidhackathon/utils/routes_name.dart';
import 'package:fluttermidhackathon/view/home_screen.dart';
import 'package:fluttermidhackathon/view/intro_screen.dart';
import 'package:fluttermidhackathon/view/login_Screen.dart';
import 'package:fluttermidhackathon/view/signup_screen.dart';
import 'package:fluttermidhackathon/view/splash_screen.dart';
import 'package:fluttermidhackathon/controllers/controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,),
      builder: (context,snapshort){
        return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_) => Controller()),
        ChangeNotifierProvider(create: (_) => CategoryChangeNotifier())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.splashScreen,
        routes: {
          RoutesName.homeScreen: (context)=> const HomeScreen(),
          RoutesName.categoryScreen: (context)=> const CategoryScreen(),
          RoutesName.splashScreen: (context)=> const SplashScreen(),
          RoutesName.introScreen: (context)=> const IntroScreen(),
          RoutesName.loginScreen: (context)=> const LoginScreen(),
          RoutesName.signupScreen: (context)=> const SignupScreen(),
        },navigatorKey: Navigation.navigationkey,
      ),
    );
      });
  }
}

