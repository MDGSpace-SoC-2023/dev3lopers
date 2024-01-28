import 'package:flutter/material.dart';

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
        onPressed: (){},
        backgroundColor: Colors.blue[600],
        child: Icon(Icons.add),
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
                    const Text('Question Answered: 10')]
                ),
              ),
            ),
          ),
          
        SliverList(delegate: SliverChildBuilderDelegate((context, index){
          return Padding(padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: BorderRadius.circular(40)
            ),
            width: MediaQuery.of(context).size.width,
            height: 200,
          ),);
        }, childCount: 10))
        ],
      ),
    );
  }
}
