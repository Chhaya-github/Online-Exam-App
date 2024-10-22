import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:onboarding/screens/forgot_password.dart';
import 'package:onboarding/screens/login_screen.dart';
import 'package:onboarding/services/firebase_auth.dart';
import 'package:onboarding/widgets/customized_button.dart';
import 'package:onboarding/widgets/customized_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register_Screen extends StatefulWidget {
  const Register_Screen({super.key});

  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void Registeration() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String username = usernameController.text.trim();
    String cpassword = confirmPasswordController.text.trim();

    if(email == "" || password == "" || username == "" || cpassword == "") {
      log("Please fill all the details!" as num);
    }
    else if(password != cpassword) {
      log("Password do not match!" as num);
    }
    else {
      log("User Created!" as num);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
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
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: IconButton(onPressed: () {
                        Navigator.pop(context);
                      }, icon: const Icon(Icons.arrow_back_ios_new)),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 600,
                  child: Column(
                    children: [
                      const SizedBox(height: 12),
                      const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Text('Hello! Register to get Started!', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                      ),
                      const SizedBox(height: 15,),
                      Customized_textfield(
                        myController: usernameController,
                        hintText: 'Username',
                        isPassword: false,
                      ),
                      Customized_textfield(
                        myController: emailController,
                        hintText: 'Enter your Email',
                        isPassword: false,
                      ),
                      Customized_textfield(
                          myController: passwordController,
                          hintText: 'Enter Password',
                          isPassword: true
                      ),
                      Customized_textfield(
                        myController: confirmPasswordController,
                        hintText: 'Confirm Password',
                        isPassword: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap:() {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPassword()));
                            },
                            child: const Text('Forgot Password?',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w700
                              ),),
                          ),
                        ),
                      ),
                      Customized_button(
                        buttonText: 'Register',
                        buttonColor: Color.fromRGBO(14, 70, 163, 5),
                        textColor: Colors.white,
                        onPressed: () async {
                          try {
                            await FirebaseAuthService().signup(emailController.text.trim(), passwordController.text.trim());
                            Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                          } on FirebaseException catch(e) {
                            print(e.message);
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 1,
                          width: 700,
                          color: Colors.grey,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Or Register with', style: TextStyle(fontSize: 15),),
                      ),
                  
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black87, width: 1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: IconButton(
                                icon: const Icon(Icons.facebook),
                                color: Colors.blueAccent,
                                onPressed: (){},
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black87, width: 1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: IconButton(
                                icon: const Icon(
                                    FontAwesomeIcons.google
                                ),
                                //color: Colors.blueAccent,
                                onPressed: (){},
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 100,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black87, width: 1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: IconButton(
                                iconSize: 30,
                                icon: const Icon(Icons.apple),
                                color: Colors.black87,
                                onPressed: (){},
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              const Text("Already have an account?", style: TextStyle(fontSize: 15, color: Colors.black87),),
                              InkWell(onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginScreen()));
                              },child:  const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Login Now', style: TextStyle(fontSize: 15, color: Colors.cyan)),
                              )
                              )
                          ]
                        ),
                      )
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
