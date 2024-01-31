
import 'package:flutter/material.dart';
var question =TextEditingController() ;
var description =TextEditingController();

class Ask_quest extends StatelessWidget {
  const Ask_quest({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(fit: StackFit.passthrough, children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[400],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 1.5,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: 2,
                decoration:
                    const InputDecoration(hintText: "Title of the Question"),
                controller: question,
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: MediaQuery.of(context).size.width / 35),
              ),
              TextField(
                controller: description,
                maxLines: 8,
                decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    hintText: 'description blah blah blah'),
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width / 40),
              )
            ],
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  question.clear();
                  description.clear();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.indigo[300],
                      borderRadius: BorderRadius.circular(6)),
                  width: 50,
                  height: 25,
                  child: Center(
                    child: Text(
                      'Post',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 6,
              ),
              GestureDetector(
                onTap: () {
                  question.clear();
                  description.clear();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.red[400],
                      borderRadius: BorderRadius.circular(6)),
                  width: 50,
                  height: 25,
                  child: Center(
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class Question_box extends StatelessWidget {
  const Question_box({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[400],
          ),
          width: 390,
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Title of the questions',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 12),
              ),
              Divider(
                height: MediaQuery.of(context).size.width / 16,
                thickness: 3,
                color: Colors.grey[500],
                endIndent: 38,
              ),
              Text(
                'description  blah blah blah',
                style:
                    TextStyle(fontSize: MediaQuery.of(context).size.width / 40),
              )
            ],
          ),
        ),
        // Positioned(
        //   right: 10,
        //   top:10,
        //   child: Container(
        //     padding: EdgeInsets.all(MediaQuery.of(context).size.width / 100),
        //     decoration: BoxDecoration(
        //         color: Colors.red[400], borderRadius: BorderRadius.circular(6)),
        //     width: 70,
        //     height: 30,
        //     child: Center(
        //       child: Text(
        //         'Delete',
        //         style: TextStyle(
        //           fontSize: MediaQuery.of(context).size.width / 40,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ),
        //   ),
        // )
      ]),
    );
  }
}