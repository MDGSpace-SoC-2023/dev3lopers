import 'package:flutter/material.dart';

class ListOf extends StatelessWidget {
  const ListOf({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Of applicants'),),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return const proposal_sent();
        },
      ),
    );
  }
}

class proposal_sent extends StatelessWidget {
  const proposal_sent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 1),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.lightBlue[300],
                borderRadius: BorderRadius.circular(12)),
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'name of the student',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        fontSize: 17,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                        color: Colors.cyan[100],
                        borderRadius: BorderRadius.circular(12)),
                    child: const SingleChildScrollView(
                      child: Text('description given by the applicant',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.none,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: [
                  ColoredBox(color: Colors.redAccent, child: Icon(Icons.close)),
                  SizedBox(width: 12),
                  ColoredBox(
                      color: Colors.lightGreen,
                      child: Icon(Icons.done_outlined))
                ],
              )),
        ],
      ),
    );
  }
}