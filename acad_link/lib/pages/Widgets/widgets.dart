// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:acad_link/pages/QnA/qna_page.dart';
import 'package:flutter/material.dart';
import '../Home/Prof_projects.dart';
import '../Home/ps.dart';
import '../application.dart';

class MainButt extends StatelessWidget {
  final String name;
  const MainButt({super.key, required this.name});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        if (name == 'Project By Professors')
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PP()))
          },
        if(name=='Project By Students')
        Navigator.push(context, MaterialPageRoute(builder: (context) => PS())),
        if(name=='QnA portal')
        Navigator.push(context, MaterialPageRoute(builder: (context) => qna_page())),
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(49),
          child: Center(
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(name,
                  selectionColor: Color.fromRGBO(209, 248, 248, 1),
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )),
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
    );
  }
}

class Pbox extends StatelessWidget {
  final String title;
  final String name;
  const Pbox({super.key, required this.title, required this.name});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: const[
               CircleAvatar(radius: 20,backgroundImage: AssetImage('assets/images/Mail.png'),),
               Text('Sparsh Mittal',style: TextStyle(fontSize: 14),)
            ],),
            Column(
              children: [
                Stack(children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 80, 20),
                      child: Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name),
                                Text(title,
                                    selectionColor:
                                        Color.fromRGBO(209, 248, 248, 1),
                                    style: TextStyle(
                                       fontSize: 7,
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ]),
                        ),
                      ),
                    ),
                    width: 354,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(180, 227, 222, 1),
                    ),
                  ),
                  Positioned(left: 280, top: 25, child: Apply(TIT: title))
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Apply extends StatelessWidget {
  final String TIT;
  const Apply({super.key, required this.TIT});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Application(
                      title: TIT,
                      description: '1234567890',
                      req: 'abcdefghijklmnopqrstuvwxyz',
                    )));
      },
      child: Container(
        child: Center(
            child: Text(
          'apply',
          style: TextStyle(
            color: Colors.white,
          ),
        )),
        width: 60,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.blue[400], borderRadius: BorderRadius.circular(24)),
      ),
    );
  }
}
