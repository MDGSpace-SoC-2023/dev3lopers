import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/globals.dart';
import 'package:awesome_dialog/awesome_dialog.dart';


class all_questions extends StatefulWidget {
  const all_questions({super.key});

  @override
  State<all_questions> createState() => _all_questionsState();
}

class _all_questionsState extends State<all_questions> {

  List<dynamic> all_questions = [];
  Future<void> get_all_questions() async{
    print(authToken);
    response = await dio.get('/qna/questions',options: Options(headers: {'auth-token':authToken }));
    all_questions = response?.data??[];
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_all_questions(), 
      builder: (context, snapshot){
        if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return const Column(
              children: [
                Icon(Icons.signal_wifi_connected_no_internet_4_sharp,size:100),
                Text('check your internet connection'),
                Text('or',style: TextStyle(fontSize: 30),),
                Text('server error, so try later'),
              ],
            );
          } else {
            if(all_questions.isEmpty){
              return const Column(
                children: [
                  Text('\u{1F62D}',style: TextStyle(fontSize: 100),),
                  Text('No Posts to display'),
                  Text('come back next time')
                ],
              );
            }else{
              print(all_questions);
              return ListView.builder(
                 itemCount: all_questions.length,
                   itemBuilder: (context, index) {
                      return Question_box();
                   }
                 
                
              );
              
            
              }
      }
  });
  }
}

class Question_box extends StatelessWidget {
  const Question_box({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
         const Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage('assets/images/OIP.jpeg'),radius: 20,),
              SizedBox(width: 4,),
              Text("mohith",style: TextStyle(fontSize: 15,decoration: TextDecoration.none),)
            ],
          ),
          const SizedBox(height: 6,),
          InkWell(
            onTap: (){
              AwesomeDialog(
                width: MediaQuery.of(context).size.width-30,
                context: context,
                body: Container(
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context,index){
                      return const answer();
                    },
                  ),
                )
              ).show();
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft:Radius.circular(12),topRight: Radius.circular(12)),
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
          ),
          InkWell(
            onTap: () 
            {
              showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AnswerAQuestion();
                  },
                );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue[700],
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
              ),
              child:Center(child: const Text('Answer',style: TextStyle(color: Colors.white,fontSize: 19,fontWeight: FontWeight.w500),)),
            ),
          )
        ],
      ),
    );
  }
}

class answer extends StatelessWidget {
  const answer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/Mail.png'),
              radius: 15,
            ),
            SizedBox(width: 5,),
            Text('Mohith',style: TextStyle(fontSize: 12),),
          ],
        ),
        const SizedBox(height: 5,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          width: MediaQuery.of(context).size.width,
          height: 100,
          child: const SingleChildScrollView(
            child: Text('short text')
          ),

        )
      ],
    );
  }
}

class AnswerAQuestion extends StatelessWidget {
   AnswerAQuestion({super.key});
  final description =TextEditingController();
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
                      'Clear',
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
    );;
  }
}
