// ignore_for_file: camel_case_types, sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';

final _title = TextEditingController();
final _req = TextEditingController();
final _dis = TextEditingController();
String tit = '';
String req = '';
String dis = '';
void main() {
  runApp(const P_post());
}

class P_post extends StatelessWidget {
  const P_post({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: [
          _input(
            string: 'Title of project',
            controller: _title,
          ),
          _input(
            string: 'Requirements',
            controller: _req,
          ),
          _input(
            string: 'Descripton',
            controller: _dis,
          ),
          _postButt()
        ],
      ),
    );
  }
}

class _input extends StatelessWidget {
  final String string;
  var controller = TextEditingController();
  _input({super.key, required this.string, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 25),
      child: Material(
        child: TextField(
          maxLines: null,
          controller: controller,
          decoration: InputDecoration(
            labelText: string,
          ),
        ),
      ),
    );
  }
}

class _postButt extends StatelessWidget {
  const _postButt({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Center(
              child: Text(
            'post',
            style: TextStyle(
              color: Colors.white,
            ),
          )),
          width: 60,
          height: 30,
          decoration: BoxDecoration(
              color: Colors.blue[400], borderRadius: BorderRadius.circular(24)),
        ),
      ),
    );
  }
}
