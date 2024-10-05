import 'package:flutter/material.dart';

class Courses extends StatefulWidget {
  const Courses({super.key});

  @override
  State<Courses> createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List imgData = [
    "assets/images/14.jpg",
    "assets/images/13.jpg",
    "assets/images/12.jpg",
    "assets/images/11.png"
  ];

  List titles = [
    "React Native",
    "Java",
    "Flutter",
    "Dart"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Courses',
          style: TextStyle(color: Color.fromRGBO(0, 80, 203, 2),),),
      ),
      body: ListView(
          children: [
            SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                  ),
                  height: MediaQuery
                      .of(context)
                      .size
                      .width,
                  width: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                          mainAxisSpacing: 25
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: imgData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 6
                                )
                              ]
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceEvenly,
                            children: [
                              Image.asset(
                                imgData[index], width: 100,),
                              Text(
                                titles[index],
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ],

            ),
                        )
          ]
      ),
    );
  }
}