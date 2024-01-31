import 'package:flutter/material.dart';
import '/globals.dart';


class interacted_questions extends StatefulWidget {
  const interacted_questions({super.key});

  @override
  State<interacted_questions> createState() => _interacted_questionsState();
}

class _interacted_questionsState extends State<interacted_questions> {

  List<dynamic> interacted_questions = [];
  Future<void> get_interacted_questions() async{
    response = await dio.get('');
    interacted_questions = response?.data??[];
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: get_interacted_questions(), 
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
            if(interacted_questions.isEmpty){
              return const Column(
                children: [
                  Text('\u{1F62D}',style: TextStyle(fontSize: 100),),
                  Text('Have Time??'),
                  Text('Help others by answering their questions')
                ],
              );
            }else{
              print(interacted_questions);
              return  SliverList(delegate: SliverChildBuilderDelegate((context, index){
                          return const Question_box();
                      }, childCount: interacted_questions.length));
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
      ]),
    );
  }
}