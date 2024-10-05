import 'package:flutter/material.dart';
import 'package:onboarding/screens/course_screen.dart';
import 'package:onboarding/screens/see_all.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({super.key});

  List catNames = [
    'Category',
    'Classes',
    'Free Courses',
    'BookStores',
    'Live Courses',
    'LeaderBoard'
  ];

  List<Color> catColors = [
    Colors.deepOrange,
    Colors.purple,
    Colors.green,
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent
  ];

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

  List<Icon> catIcons = [
    const Icon(Icons.category, color: Colors.white, size: 30,),
    const Icon(Icons.video_library, color: Colors.white, size: 30),
    const Icon(Icons.assignment, color: Colors.white, size: 30),
    const Icon(Icons.store, color: Colors.white, size: 30,),
    const Icon(Icons.play_circle_filled, color: Colors.white, size: 30),
    const Icon(Icons.emoji_events, color: Colors.white, size: 30,)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: 15, left: 15, right: 15, bottom: 10),
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(0,80,203,2),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                      )
                  ),
                  child: Column(
                    children: [
                       const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.dashboard, size: 30, color: Colors.white),
                          Icon(
                            Icons.notifications, size: 30, color: Colors.white,)
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Align(
                          alignment: Alignment.topLeft,
                          child: Text('Hi, Programmers', style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),)),
                      const SizedBox(height: 20),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 20),
                        height: 50,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.blueAccent)),
                              hintText: 'Search here...',
                              hintStyle: const TextStyle(color: Colors.black54),
                              prefixIcon: const Icon(Icons.search)
                          ),
                        ),
                      ),

                    ],

                  ),
                ),
                const SizedBox(height: 20,),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      GridView.builder(
                          itemCount: catNames.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 1.3
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      color: catColors[index],
                                      shape: BoxShape.circle
                                  ),
                                  child: catIcons[index],
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  catNames[index],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black
                                  ),
                                )
                              ],
                            );
                          }
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Courses', style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.w600),),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Courses()));
                            },
                            child: Row(
                              children: [
                                Text('See All', style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),),
                                Text('→', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                              ],
                            ),
                          ),
                        ],
                      ),
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
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CourseScreen(imgData[index])));
                                },
                                child: Container(
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
                                ),
                              );
                            }),
                      )
                    ],

                  ),
                )


              ]
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black87,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled, size: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_box, size: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none_sharp, size: 28),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin, size: 28),
                label: '',
              ),
            ],
          ),
        )
    );
  }
}

/*appBar: AppBar(
backgroundColor: Colors.blueAccent,
title: const Text('HomePage',
style: TextStyle(fontSize: 20, color: Colors.white, ),
),
actions: [
ElevatedButton(onPressed: () {
FirebaseAuth.instance.signOut();
//Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
}, child: const Text('Sign Out'),
)
],
),
drawer: Drawer(
child: Column(
children: [
const UserAccountsDrawerHeader(
accountName: Text(
'Chhaya Khapekar'
),
accountEmail: Text(
'chhaya@gmail.com'
),
currentAccountPicture: CircleAvatar(
child: Text('P'),
backgroundColor: Colors.white,
),
),
ListTile(
leading: const Icon(Icons.home),
title: const Text('Home'),
onTap: (){
print('tapped');
},
),
ListTile(
leading: const Icon(Icons.search_off),
title: const Text('Search'),
onTap: () {
print('tap');
},
),
ListTile(
leading: const Icon(Icons.star_border_outlined),
title: const Text('Favourites'),
onTap: (){
print('ontap');
},
),
ListTile(
leading: const Icon(Icons.live_help_outlined),
title: const Text('Help'),
onTap: (){
print('ontap');
},
),
const Divider(),
ListTile(
leading: const Icon(Icons.contact_mail_outlined),
title: const Text('Contacts'),
onTap: (){
print('contacts');
},
)
],
),
)*/

//218, 114, 151
//67, 85, 133
//67, 85, 133
//39, 158, 255
//14, 70, 163, 5