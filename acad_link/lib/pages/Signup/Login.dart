
import "package:acad_link/pages/Home/Home.dart";
import "package:flutter/material.dart";
import "dart:ui";
import 'package:dio/dio.dart';

import "SignUp.dart";
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  dynamic error_code;
  // ignore: unnecessary_brace_in_string_interps
   late SnackBar snackBar;

    Future<bool> _login() async {
      final Dio _dio = Dio(BaseOptions(
        baseUrl: 'https://68b3-103-37-201-178.ngrok-free.app/',
        contentType: 'application/json',
      ));
      print("starting the request now");
      try {
        Response response = await _dio.post('/users/login', data: {
          'email': _emailController.text,
          'password': _passwordController.text,
        });
        final authToken = response.data['authToken'];
        print(authToken);
        print("received response");
        response = await _dio.post('/users/getuser', options: Options(headers: {'auth-token':authToken}));
        // print(response.data);
        if(response.data['verfied']){
          print(response.data);
        }
        return true;

      } on DioException catch (e) {
        print(e.response?.statusCode);
        error_code = e.response?.statusCode;
        print("login failed");
        return false;
      }
    }
  @override
  Widget build(BuildContext context) {

    snackBar = SnackBar(content: Text(error_code.toString(),textAlign: TextAlign.center,));
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color(0xffc0efff),
            Color(0xff98abfc),
            // Color(0xffc5eeff),
            Color(0xffdff5fc)
          ],
              stops: [
            0.03,
            0.27,
            // 0.65,
            1
          ])),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(38.0, 180.0, 38.0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
               TextField(
                controller: _emailController,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color(0xffffffff),
                  prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: 10.0,
                        top: 23.0,
                        bottom: 23.0,
                      ),
                      child: Icon(Icons.person, color: Color(0xff366bff))),
                  hintText: 'USER MAIL',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    decorationColor: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                ),
              ),
              /*----------------------PASSWORD-----------------*/
               Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 23.0, 10.0, 0.0),
                child: TextField(
                  controller: _passwordController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xffffffff),
                        prefixIcon: Padding(
                            padding: EdgeInsetsDirectional.only(
                                start: 10.0, top: 23.0, bottom: 23.0),
                            child: Icon(Icons.lock, color: Color(0xff366bff))),
                        hintText: 'PASSWORD',
                        hintStyle: TextStyle(
                            decorationColor: Color.fromRGBO(0, 0, 0, 0),
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))))),
              ),
              /*------------------------------forgot password------------------*/
              Padding(
                  padding: const EdgeInsets.only(top: 4.0, right: 20.0),
                  child: InkWell(
                    onTap: () {},
                    child: const Text(
                      'forgot password',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )),
              /*----------------Login Button---------------------*/

              Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 19.0, right: 23.0, bottom: 8),
                child: Material(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  color: Colors.lightGreen,
                  child: InkWell(
                      onTap: () async {
                        print("login pressed");
                        if(await _login()){
                          // ignore: use_build_context_synchronously
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                        }else{
                          if(error_code == 404){
                            print("login fetch failed");
                          }
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          print(error_code);
                        }

                      
                      
        

                        
                      },
                      child: const Text('Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              height: 2.5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0))),
                ),
              ),

              /*--------signup---------*/
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MainApp()));
                },
                child: const Text(
                  'signup',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          )),
    ));
  }
}
