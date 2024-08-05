import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
              signup(passwordController.text,emailController.text);
              emailController.clear();
              passwordController.clear();
            }, 
            child: Text('Login')
            ),
        ],
      ),
    );
  }
  void signup(String passwordController,String emailController)async{
    try {
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController,
    password: passwordController,
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
  }
}