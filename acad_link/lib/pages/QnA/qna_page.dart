import 'package:acad_link/pages/QnA/questions.dart';
import 'package:flutter/material.dart';
import '/pages/QnA/all_question.dart';
import '/pages/QnA/my_questions.dart';
import '/pages/QnA/interacted_questions.dart';

class qna_page extends StatefulWidget {
  const qna_page({super.key});

  @override
  State<qna_page> createState() => _qna_pageState();
}

class _qna_pageState extends State<qna_page> with SingleTickerProviderStateMixin {
    
  late TabController tabcontroller;
  

  @override
  void initState(){
    super.initState();
    tabcontroller = TabController(vsync: this, length: 3, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return const Ask_quest();
                  },
                );
        },
        backgroundColor: Colors.blue[600],
        child:const Icon(Icons.add),
      ),
      body: CustomScrollView(
        slivers: [
          
          SliverAppBar(
            expandedHeight: 300,
            bottom: TabBar(
              controller: tabcontroller,
              tabs: const [
                Text('My Questions'),
                Text('All Questions'),
                Text("Interacted Questions")
              ],
            ),
            // backgroundColor: Colors.amber[700],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color.fromARGB(255, 27, 101, 214),Color.fromARGB(255, 124, 228, 235)], stops: [0,1],begin: Alignment.topCenter,end: Alignment.bottomCenter)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width:100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: const DecorationImage(image: AssetImage('assets/images/OIP.jpeg')),
                        borderRadius: BorderRadius.circular(30)
                        ),
                    ),
                    const Text('Question Asked: 25'),
                    const Text('Question Answered: 10'),
                   const SizedBox(height: 60,)]
                ),
              ),
            ),
          ),
           SliverFillRemaining(child: TabBarView(
              controller: tabcontroller,
              children: 
            const [
              my_questions(),
              all_questions(),
              interacted_questions()
            ]
            ),)  
          
          
        
        ],
      ),
    );
  }
}
