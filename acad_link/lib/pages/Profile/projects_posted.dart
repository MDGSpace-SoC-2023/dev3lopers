// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names
class applications_recieved extends StatelessWidget {
  const applications_recieved({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
        return _propose(
            title: 'name i think',
            name:
                'description i thinnk but i was gravely wrong as it was actually the name');
      });
  }
}

class _propose extends StatelessWidget {
  final String title;
  final String name;
  const _propose({super.key, required this.title, required this.name});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: Column(
          children: [
            Stack(children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 80, 20),
                  child: Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 12,
                                  color: Colors.black),
                            ),
                            Text(title,
                                selectionColor:
                                    Color.fromRGBO(209, 248, 248, 1),
                                style: TextStyle(
                                  fontSize: 15,
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                    ),
                  ),
                ),
                width: 354,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color.fromRGBO(180, 227, 222, 1),
                ),
              ),
              Positioned(
                left: 280,
                top: 17,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.blue[600],
                      child: Text(
                        '12',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: 45,
                      height: 20,
                      padding: EdgeInsets.all(2),
                      child: Text(
                        'Delete',
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 14),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
