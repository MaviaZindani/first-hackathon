import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttermidhackathon/utils/navigation.dart';
import 'package:fluttermidhackathon/utils/routes_name.dart';
import 'package:fluttermidhackathon/view/home_screen.dart';
import 'package:fluttermidhackathon/view/intro_screen.dart';
import 'package:fluttermidhackathon/view/login_Screen.dart';
import 'package:fluttermidhackathon/view/signup_screen.dart';
import 'package:fluttermidhackathon/view/splash_screen.dart';
import 'package:fluttermidhackathon/view/product_screen.dart';
import 'package:fluttermidhackathon/view/chackout_screen.dart';
import 'package:fluttermidhackathon/view/favorite_screen.dart';
import 'package:fluttermidhackathon/view/category_screen.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.homeScreen,
        routes: {
          RoutesName.chackoutScreen: (context) => const ChackoutScreen(),
          RoutesName.homeScreen: (context)=> const HomeScreen(),
          RoutesName.productScreen: (context)=> const ProductScreen(),
          RoutesName.favoriteScreen: (context)=> const FavoriteScreen(),
          RoutesName.introScreen: (context)=> const IntroScreen(),
          RoutesName.loginScreen: (context)=> const LoginScreen(),
          RoutesName.splashScreen: (context)=> const SplashScreen(),
          RoutesName.signupScreen: (context)=> const SignupScreen(),
          RoutesName.categoryScreen: (context)=> const CategoryScreen(),
        },
        navigatorKey: Navigation.navigationkey,
      ),
    );
      });
  }
}

