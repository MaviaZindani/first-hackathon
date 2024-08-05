import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/utils/bottem_navigation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              label: Text('Email'),
            ),
            
          ),
          const SizedBox(height: 30,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              label: Text('Password'),
            ),
          ),
          const SizedBox(height: 50,),
          ElevatedButton(
            onPressed: (){
              login(passwordController.text.trim(),emailController.text.trim());
              emailController.clear();
              passwordController.clear();
            }, 
            child: Text('Login')
            ),
        ],
      ),
      bottomNavigationBar: BottemNavigation(selectIndex: 3),
    );
  }
  void login(String passwordController,String emailController) async{
    try {
   await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController,
    password: passwordController,
  );
  print('done');
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
}
}