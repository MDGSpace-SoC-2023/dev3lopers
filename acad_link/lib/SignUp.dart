// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'SignUpProffesors.dart';
import 'SignUpStudents.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(209, 248, 248, 1),
        body: Center(
          child: Column(
            children: [
              Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 89,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpProffesors()));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(49),
                        child: Text(
                          'Signup as Professor',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple[300]),
                        ),
                      ),
                      width: 312,
                      height: 175,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Color.fromRGBO(180, 227, 222, 1),
                          border: Border(
                              top: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(147, 178, 174, 1)),
                              right: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(147, 178, 174, 1),
                              ))),
                    ),
                  ),
                  SizedBox(height: 120),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpStudents()));
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(49),
                        child: Text(
                          'Signup as a student',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple[300]),
                        ),
                      ),
                      width: 312,
                      height: 175,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          color: Color.fromRGBO(180, 227, 222, 1),
                          border: Border(
                              top: BorderSide(
                                  width: 2,
                                  color: Color.fromRGBO(147, 178, 174, 1)),
                              right: BorderSide(
                                width: 2,
                                color: Color.fromRGBO(147, 178, 174, 1),
                              ))),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
