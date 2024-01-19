// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'SignUpStudents.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            child: Text(
              'back',
              style: TextStyle(
                  color: Colors.black, decoration: TextDecoration.none),
              textAlign: TextAlign.center, // Align the text to the center
            ),
          ),
          SizedBox(height: 16.0), // Add some gap between text and avatar
          CircleAvatar(
            radius: 50.0,
            backgroundImage:
                AssetImage('assets/images/2021_Facebook_icon.svg.png'),
          )
        ],
      ),
    );
  }
}
