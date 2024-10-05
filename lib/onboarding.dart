import 'package:flutter/material.dart';
import 'package:onboarding/intro_page/intro_page1.dart';
import 'package:onboarding/intro_page/intro_page2.dart';
import 'package:onboarding/intro_page/intro_page3.dart';
import 'package:onboarding/intro_page/intro_page4.dart';
import 'package:onboarding/screens/welcome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  onLastPage = (index == 3);
                });
              },
              children: const [
                Intro_Page1(),
                Intro_Page2(),
                Intro_Page3(),
                Intro_Page4()
              ],
            ),
            Container(
              alignment: const Alignment(0, 0.75),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        _controller.jumpToPage(3);
                      },
                       child: const Text('Skip', style: TextStyle(fontSize: 18 ),)
                    ),
                    SmoothPageIndicator(controller: _controller, count: 4),
                    onLastPage?
                    GestureDetector(
                      onTap: (){
                       Navigator.pushReplacement(context,
                           MaterialPageRoute(builder: (context){
                             return const HomePage();
                           }
                           )
                       );
                      },
                      child: const Text('Done', style: TextStyle(fontSize: 18 ),),
                    )
                        :GestureDetector(
                        onTap: (){
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeIn);
                      },
                      child: const Text('Next',style: TextStyle(fontSize: 18 ),),)
                  ],
                ))
          ],
        )
      ),
    );
  }
}