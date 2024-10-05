import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding/screens/login_screen.dart';
import 'package:onboarding/screens/register_screen.dart';
import 'package:onboarding/widgets/customized_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 600,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Container(
                      height: 450,
                      width: 450,
                      child: Center(child: Lottie.network('https://lottie.host/77860578-c3a3-4329-a9d5-521c82a561ea/yjeVdJEr4b.json',)),
                    ),
                  ),
                  Customized_button(
                      buttonText: 'Login',
                      buttonColor: Color.fromRGBO(14, 70, 163, 5),
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                      },
      
                  ),
                  Customized_button(
                      buttonText: 'Register',
                      buttonColor: Colors.white,
                      textColor: Color.fromRGBO(14, 70, 163, 5),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => Register_Screen()));
                      }
                  ),
      
      
      
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
