import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: answer(),
    );
  }
}

class answer extends StatelessWidget {
  const answer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/Mail.png'),
              radius: 15,
            ),
            SizedBox(width: 5,),
            Text('Mohith',style: TextStyle(fontSize: 12),),
          ],
        ),
        const SizedBox(height: 5,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: const SingleChildScrollView(
            child: Text('short text')
          ),

        )
      ],
    );
  }
}