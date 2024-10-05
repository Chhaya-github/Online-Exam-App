import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
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
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(onPressed: () {
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.arrow_back_ios_new)),
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
                              child: Lottie.network('https://lottie.host/9280dfc7-c09c-41e6-a24a-d9e2ec5ecf01/dBvpyIHGAL.json')
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
                        isPassword: true
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: (){
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
                    buttonText: 'Login',
                    buttonColor: Color.fromRGBO(14, 70, 163, 5),
                    textColor: Colors.white,
                    onPressed: () async {
                      try {
                        await FirebaseAuthService().login(
                            emailController.text.trim(),
                            passwordController.text.trim());
                        if(FirebaseAuth.instance.currentUser != null) {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                        }
                        else {
                          showDialog(context: context,
                              builder: (context) => AlertDialog(
                               title: const Text('Invalid Username or Password.Please register again and make sure that email and password is correct'),
                                actions: [
                                  ElevatedButton(
                                      child: const Text('Register now'),
                                  onPressed: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context) => const Register_Screen()));
                                  },
                                  )
                                ]
                          )
                      );
                        }
                      } on FirebaseException catch(e) {
                           print(e.message);
                      }
                    },
                   ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 1,
                        width: 700,
                        color: Colors.grey,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text('Or Login with', style: TextStyle(fontSize: 15),),
                      ),
      
                      Padding(
                        padding: const EdgeInsets.all(5.0),
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
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              const Text("Don't have an account?", style: TextStyle(fontSize: 15, color: Colors.black87),),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_) => const Register_Screen()));
                                },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('Register Now', style: TextStyle(fontSize: 15, color: Colors.cyan),),
                                  ))
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
}
