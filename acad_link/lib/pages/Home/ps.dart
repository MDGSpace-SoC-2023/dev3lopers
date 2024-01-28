// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

List<String> project_name=['dvvv','vccvn'];
class PS extends StatelessWidget {
  const PS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 248, 248, 1),
      body: Center(
          child: ListView.builder(
        itemCount: project_name.length,
        itemBuilder: (context, index) {
          return Pbox(
              title:
                  project_name[index],
              name: 'a student');
        },
      )),
    );
  }
}
