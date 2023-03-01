import 'package:flutter/material.dart';
import 'package:hostel_management_system1/Dashboard/Favourite_page.dart';

import '../booking_form.dart';
import 'Home_page.dart';
import 'my_page.dart';

class MainPage extends StatefulWidget {
  // const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages=[
    HomePage(),
    SignUP(),
    // FavouritePage(),
    MyPage()
  ];
  int currentIndex=0;
  void onTap(int index){
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex ],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels:false,
        showSelectedLabels: true,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.apps),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_online),
              label: "Book"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          )
        ],
      ),
    );
  }
}
