// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';


class PP extends StatelessWidget {
  const PP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Professor\'s Projects',),
      centerTitle: true,
      shape: RoundedRectangleBorder(borderRadius:BorderRadius.vertical(bottom: Radius.circular(40))) ,),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.add,color: Colors.blue[400],),
        backgroundColor: Color.fromARGB(255, 59, 59, 59),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'Menu'),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_rounded),label: 'Profile'),
      ],),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Row(children:[
      //     Icon(Icons.menu),
      //     Icon(Icons.home),
      //     Icon(Icons.account_circle)
      //   ]),
      // ),
        backgroundColor: Color.fromRGBO(209, 248, 248, 1),
        body: Center(
            child: ListView.builder(
          itemCount: 25,
          itemBuilder: (context, index) {
            return Pbox(
                title:
                    ' a project with a really long name open for UG 2 y only',
                name: 'a professor');
          },
        )),
      );
  }
}
