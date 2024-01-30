import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '/globals.dart';


class my_questions extends StatefulWidget {
  const my_questions({super.key});

  @override
  State<my_questions> createState() => _my_questionsState();
}

class _my_questionsState extends State<my_questions> {

  List<dynamic> my_questions = [];
  Future<void> get_my_questions() async{
    print(authToken);
    response = await dio.get('/qna/questions',options: Options(headers: {'auth-token':authToken }));
    my_questions = response?.data??[];
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_my_questions(), 
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
            if(my_questions.isEmpty){
              return const Column(
                children: [
                  Text('\u{1F62D}',style: TextStyle(fontSize: 100),),
                  Text('No Posts to display'),
                  Text('come back next time')
                ],
              );
            }else{
              print(my_questions);
              return ListView.builder(
                 itemCount: my_questions.length,
                   itemBuilder: (context, index) {
                      return const Question_box();
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
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[400],
          ),
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
                height: 25,
                thickness: 2,
                color: Colors.grey[500],
                endIndent: 38,
              ),
              const Text(
                'description  blah blah blah',
                style:
                    TextStyle(fontSize: 13),
              )
            ],
          ),
        ),
      ]),
    );
  }
}