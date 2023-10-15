import 'package:firebase_login_signup/calendar/calendar.dart';
import 'package:firebase_login_signup/home/home.dart';
import 'package:firebase_login_signup/inbox/inbox.dart';
import 'package:firebase_login_signup/profile/profile.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  final List<Widget> screen = [
    const Home(),
    const Calendar(),
    const Inbox(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xfff77546),
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        onTap: (int index){
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calendar',
            icon: Icon(Icons.calendar_month,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Inbox',
            icon: Icon(Icons.message_outlined,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person,
              size: 25,
            ),
          ),
        ],
      ),
    );
  }
}
