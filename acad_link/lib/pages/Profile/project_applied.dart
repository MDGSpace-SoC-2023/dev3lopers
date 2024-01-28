import "package:flutter/material.dart";
import "dart:math";

void main() => runApp(applied());

class applied extends StatelessWidget {
  const applied({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index )
        {
          return projects_applied(title: 'My project', requriements: {'cgpa':7}, description: 'this is description');
        },
      ),
    );
  }
}

class projects_applied extends StatelessWidget {
  projects_applied({super.key, required String title, required Map requriements, required String description});
  
  final List<Color> _boxColor = [ Colors.red, Colors.green, Colors.blue, Colors.white, Colors.orange, Colors.pink, Colors.blueGrey, Colors.yellow];
  
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _boxColor[Random().nextInt(_boxColor.length)]
          ),
          width: MediaQuery.of(context).size.width -20,
          height: (MediaQuery.of(context).size.width)/2-10,
          child:const Column(
             children: [],),
        ),
      ),
    );
  }
}