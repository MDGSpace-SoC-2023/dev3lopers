import 'package:acad_link/globals.dart';
import 'package:acad_link/pages/Home/HomePage.dart';
import 'package:acad_link/pages/Signup/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
} 

class MyApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MyApp({super.key, required this.prefs});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = prefs.getBool('isLoggedIn')??false;
    authToken = prefs.getString('authToken');
    print(isLoggedIn);
    return MaterialApp(
      // Application name
      title: 'AcadLink',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: isLoggedIn ? Home():const Login(),

    );
  }
}
