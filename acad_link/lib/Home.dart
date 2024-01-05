// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromRGBO(209, 248, 248, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(125, 130, 242, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25),
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                'HOME',
                style: TextStyle(
                  color: Color.fromRGBO(209, 248, 248, 1),
                ),
              ),
            ),
            titleSpacing: 100,
            centerTitle: true,
          ),
          body: Center(
            child: Column(
              children: [
                Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(49),
                        child: Text(
                          'PROJECT BY PROF',
                          selectionColor: Color.fromRGBO(209, 248, 248, 1),
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      width: 312,
                      height: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Color.fromRGBO(180, 227, 222, 1),
                      ),
                    ),
                    SizedBox(height: 120),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(52),
                        child: Text('STUD'),
                      ),
                      width: 312,
                      height: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                        color: Color.fromRGBO(180, 227, 222, 1),
                      ),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
