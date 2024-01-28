
import 'package:acad_link/pages/QnA/qna_page.dart';
import 'package:acad_link/pages/Signup/SignUp.dart';
import 'pages/Home/Prof_projects.dart';
import 'package:acad_link/pages/Signup/Login.dart';
import 'package:flutter/material.dart';
import 'pages/Home/Home.dart';
// import '';
//import 'HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'AcadLink',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home:const  PP(),
    );
  }
}
