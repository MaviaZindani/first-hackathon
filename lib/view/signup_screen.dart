import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttermidhackathon/components.dart';
import 'package:fluttermidhackathon/utils/routes_name.dart';
import 'package:fluttermidhackathon/view/home_screen.dart';

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
  TextEditingController nameController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: e_purpelColor,),
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: e_whiteItemBoxColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(alignment: Alignment.centerLeft,child: Image.asset('assets/images/Logo.png')),
                          const SizedBox(height: 10,),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Full Name',
                               style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: e_blacktextColor)),
                                                  const SizedBox(height: 10,),
                              TextField(
                                keyboardType: TextInputType.name,
                                controller: nameController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: e_greytextColor,
                                        width: 1.2,
                                      )),
                                  label: const Text(
                                    'Full Name',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: e_blacktextColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Email',
                               style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: e_blacktextColor)),
                                                  const SizedBox(height: 10,),
                              TextField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: e_greytextColor,
                                        width: 1.2,
                                      )),
                                  label: const Text(
                                    'Email',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: e_blacktextColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Password',
                               style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: e_blacktextColor)),
                                                  const SizedBox(height: 10,),
                              TextField(
                                keyboardType: TextInputType.visiblePassword,
                                controller: passwordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      gapPadding: 3,
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: e_greytextColor,
                                        width: 1.2,
                                      )),
                                  label: const Text(
                                    'Password',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: e_blacktextColor),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
                            },
                            child: Container(
                              width: double.maxFinite,
                              height: 49.45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: e_purpelColor,
                              ),
                              child: const Center(
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: e_whitetextColor,
                                      fontSize: 14.95,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(
                                    color: e_blacktextColor,
                                    fontSize: 14.95,
                                    fontWeight: FontWeight.w400),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, RoutesName.loginScreen);
                                },
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(
                                      color: e_blacktextColor,
                                      fontSize: 14.95,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    '@Copyright 2024',
                    style: TextStyle(
                        fontSize: 14.95,
                        fontWeight: FontWeight.w400,
                        color: e_whitetextColor),
                  ),
                ),
              
              ],
            ),
          ],
        ),
      ),
    );
  }
  void signup(String passwordController,String emailController)async{
    try {
   await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController,
    password: passwordController,
  );
  Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
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