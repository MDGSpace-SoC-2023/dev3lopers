// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, file_names

import 'package:flutter/material.dart';
import '../Widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(209, 248, 248, 1),
      body: Center(
        child: Column(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: SizedBox(
                height: 89,
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: MainButt(name: 'Project By Professors'),
            ),
            Flexible(fit: FlexFit.tight, flex: 1, child: SizedBox(height: 120)),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: MainButt(name: 'Project By students')),
            SizedBox(
              height: 22,
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: MainButt(name: 'QnA portal')),
          ],
        ),
      ),
    );
  }
}
