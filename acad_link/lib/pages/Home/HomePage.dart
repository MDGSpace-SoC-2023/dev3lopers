// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:acad_link/pages/Home/Projects.dart';
import 'package:acad_link/pages/Profile/Profile.dart';
import 'package:acad_link/pages/QnA/qna_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 1;
   final List<Widget> _pages = [
    qna_page(),
    Projects(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.quiz_rounded),label: 'QnA'),
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: 'Profile'),
      ],),
      backgroundColor: Colors.white,
        // backgroundColor: Color.fromRGBO(209, 248, 248, 1),
        body: _pages[_currentIndex]
      );
  }
}
