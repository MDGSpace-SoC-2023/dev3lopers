import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/pages/Signup/Login.dart';
import 'dart:ui';


final _emailEntered = TextEditingController();
final _password = TextEditingController();
final _name = TextEditingController();
String email = '';
String pass = '';
String name = '';

class SignUpStudents extends StatefulWidget {
  const SignUpStudents({super.key});

  @override
  _SignUpStudents createState() => _SignUpStudents();
}

class _SignUpStudents extends State<SignUpStudents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(209, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(125, 130, 242, 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(209, 248, 248, 1), //change your color here
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            '      Registration for Students',
            style: TextStyle(
              color: Color.fromRGBO(209, 248, 248, 1),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 5),
                child: TextField(
                  controller: _emailEntered,
                  decoration: const InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(27, 0, 27, 5),
                child: TextField(
                  controller: _name,
                  decoration: const InputDecoration(
                    hintText: 'name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(29, 0, 29, 0),
                child: TextField(
                  controller: _password,
                  decoration: const InputDecoration(
                    hintText: 'password',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () async {
                   
                      email = _emailEntered.text;
                      pass = _password.text;
                      name = _name.text;
                      final Dio _dio = Dio(BaseOptions(
                        baseUrl: 'https://68b3-103-37-201-178.ngrok-free.app',
                        contentType: 'application/json',
                      ));
                      try{
                       Response response =  await _dio.post('/users/registeruser',
                       data: {
                          'name': name,
                          'enrollmentNumber':22109238,
                          'email': email,
                          'password': pass,
                          'role': false,
                       });
                       print(response.data);
                       Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login()));
                    
                       
                      }on DioException catch(e){
                        print(e.response);
                      }
                      
                  },
                  child: Text(
                    'Signup',
                    style: TextStyle(color: Colors.purple[900]),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
