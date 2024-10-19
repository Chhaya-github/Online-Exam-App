import 'package:flutter/material.dart';
import 'package:onboarding/screens/login_screen.dart';
import 'package:onboarding/widgets/customized_button.dart';
import 'package:onboarding/widgets/customized_textfield.dart';

class ForgotPassword extends StatefulWidget {

  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
     body: SingleChildScrollView(
       child: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Container(
                 height: 40,
                 width: 40,
                 decoration: BoxDecoration(
                   border: Border.all(color: Colors.black87),
                   borderRadius: BorderRadius.circular(10)
                 ),child: IconButton(
                 icon: Icon(Icons.arrow_back_ios_new),
                 onPressed: (){
                   Navigator.pop(context);
                 },
               ),
               ),
             ),
           ),
           SizedBox(height: 40),
           Text('Forgot Password?', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
           Text("Don't worry it occurs."),
           Text('Please enter the email address linked with your account'),
           SizedBox(height: 20),
           Container(
             width: 600,
             child: Column(
               children: [
                 Customized_textfield(
                   myController: emailController,
                   hintText: 'Enter your Email',
                   isPassword: false,
                 ),
                 Customized_button(
                   buttonColor: Colors.black87,
                   textColor: Colors.white,
                   buttonText: 'Send Code',
                   onPressed: (){
                     Navigator.pop(context);
                   },
                 ),
                 SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Align(
                     alignment: Alignment.bottomCenter,
                     child: Row(
                       children: [
                         Text('Remember Password? '),
                         InkWell(
                             onTap: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                             },
                             child: Text('Login', style: TextStyle(color: Colors.cyan))
                         ) ],
                     ),
                   ),
                 )
               ],
             ),
           )
         ],
       ),
     ),

    )
    );
  }
}
