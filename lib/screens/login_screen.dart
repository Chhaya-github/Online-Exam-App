import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/screens/forgot_password.dart';
import 'package:onboarding/screens/home_screen.dart';
import 'package:onboarding/screens/register_screen.dart';
import 'package:onboarding/services/firebase_auth.dart';
import 'package:onboarding/widgets/customized_button.dart';
import 'package:onboarding/widgets/customized_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new)),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 600,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
                          child: Center(
                            child: Image.asset(
                              'assets/images/login.png',
                              height: 400,
                              width: 400,
                            ),
                          ),
                        ),
                      ),
                      Customized_textfield(
                        myController: emailController,
                        hintText: 'Enter your Email',
                        isPassword: false,
                      ),
                      Customized_textfield(
                          myController: passwordController,
                          hintText: 'Enter Password',
                          isPassword: true),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const ForgotPassword(),
                                ),
                              );
                            },
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black87, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Customized_button(
                        buttonText: 'Login',
                        buttonColor: Color.fromRGBO(14, 70, 163, 5),
                        textColor: Colors.white,
                        onPressed: () async {
                          try {
                            final userCredential = await FirebaseAuthService()
                                .login(emailController.text.trim(), passwordController.text.trim());
                            if (userCredential.user != null) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) => HomeScreen()),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text(
                                      'Invalid Username or Password.Please register again and make sure that email and password is correct'),
                                  actions: [
                                    ElevatedButton(
                                      child: const Text('Register now'),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const Register_Screen(),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              );
                            }
                          } on FirebaseException catch (e) {
                            log(e.message.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.message.toString()),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: 700,
                        color: Colors.grey,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Or Login with',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: // google sing in button
                            Container(
                          // decoration: googleButtonDecoration(),
                          height: height * 0.06,
                          width: width * 0.9,
                          child: ElevatedButton(
                            // style: googleButtonStyle(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 22,
                                  width: 22,
                                  child: Image.asset('assets/icons/google.png'),
                                ),
                                const SizedBox(width: 8),
                                const Text(
                                  'Sign in with Google',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ), // or any other Google icon you want to use
                            onPressed: () {
                              // signInWithGoogle(ref);
                              signInWithGoogle();
                            }, // Change this to your desired text color
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(fontSize: 15, color: Colors.black87),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) => const Register_Screen()));
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Register Now',
                                    style: TextStyle(fontSize: 15, color: Colors.cyan),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signInWithGoogle() {
    FirebaseAuthService().signInWithGoogle();
  }
}
