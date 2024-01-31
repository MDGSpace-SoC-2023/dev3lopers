// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:acad_link/globals.dart';
import 'Login.dart';

final _name = TextEditingController();
final _emailEntered = TextEditingController();
final _password = TextEditingController();

String email = '';
String pass = '';
String name = '';

class SignUpProffesors extends StatelessWidget {
  const SignUpProffesors({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 248, 248, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(125, 130, 242, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25),
          ),
        ),
        iconTheme: IconThemeData(
          color: Color.fromRGBO(209, 248, 248, 1), //change your color here
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            '      Registration for Professor',
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
              SizedBox(
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 5),
                child: TextField(
                  controller: _emailEntered,
                  decoration: InputDecoration(
                    hintText: 'email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(27, 0, 27, 5),
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    hintText: 'name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(29, 0, 29, 0),
                child: TextField(
                  controller: _password,
                  decoration: InputDecoration(
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
                    try{
                      response = await dio.post('/users/registeruser', 
                    data: {
                      'name': name,
                      'role':true,
                      'email':email,
                      'password': pass
                    });
                    print('code is running here');
                    print(response?.data);
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                    }on DioException catch(error){
                      print('code is here in the error');
                      print(error);
                      print(error.response);
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
