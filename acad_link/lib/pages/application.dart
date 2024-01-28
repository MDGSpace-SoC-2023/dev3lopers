// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  final String title, description, req;
  const Application(
      {super.key,
      required this.title,
      required this.description,
      required this.req});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: Color.fromRGBO(209, 248, 248, 1),
        child: Center(
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title',
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: Colors.cyan[900]),
                  ),
                  Dia(content: title),
                  Text(
                    'Requirements',
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: Colors.cyan[900]),
                  ),
                  Dia(content: req),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: Colors.cyan[900]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        description,
                        style: TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Colors.cyan[50]),
                      ),
                    ),
                    width: 354,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 120, 166, 189),
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.none,
                        color: Colors.cyan[900]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Material(
                    color: Color.fromRGBO(209, 248, 248, 1),
                    child: Container(
                      width: 354,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 120, 166, 189),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextField(
                              maxLines:null,
                          style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Colors.cyan[50]),
                          decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: Colors.cyan[50], fontSize: 20),
                            focusedBorder: InputBorder.none,
                            hintText: 'Tell about yourself',
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
              Ap()
            ],
          ),
        ),
      ),
    );
  }
}

class Dia extends StatelessWidget {
  final String content;
  const Dia({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              content,
              style: TextStyle(
                color: Colors.cyan[50],
                decoration: TextDecoration.none,
                fontSize: 20,
              ),
            ),
          ),
        ),
        width: 354,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(255, 120, 166, 189),
        ),
      ),
      SizedBox(
        height: 5,
      ),
    ]);
  }
}

class Ap extends StatelessWidget {
  const Ap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'APPLY',
        style: TextStyle(
            color: Colors.white, fontSize: 25, decoration: TextDecoration.none),
      )),
      width: 300,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue[400], borderRadius: BorderRadius.circular(22)),
    );
  }
}
