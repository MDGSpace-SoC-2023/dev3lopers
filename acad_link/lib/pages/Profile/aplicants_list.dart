import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:acad_link/globals.dart';


class ListOf extends StatelessWidget {
  final String id;
    List<dynamic> proposals = [];
   ListOf({super.key,required this.id});
   Future<void> get_proposals() async{

      response = await dio.get('/proposal/openproposal/$id',options:Options(headers: {'auth-token':authToken}));
      proposals = response?.data??[];
   }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Of applicants'),),
      body: FutureBuilder(
        future: get_proposals(),
        builder:  (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); 
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(
              child:  Column(
                children: [
                  Icon(Icons.signal_wifi_connected_no_internet_4_sharp,size:100),
                  Text('check your internet connection'),
                  Text('or',style: TextStyle(fontSize: 30),),
                  Text('server error, so try later'),
                ],
              ),
            );
          } else {
            if(proposals.isEmpty){
              return const Center(
                child:  Column(
                  children: [
                    Text('\u{1F62D}',style: TextStyle(fontSize: 100),),
                    Text('No proposals to display'),
                    Text('see you again'),
                  ],
                ),
              );
            }else{
              print(proposals);
              // List<String> requirement_list = professor_project_posts[0]['requirements']['skills'].map((dynamic item) => item.toString()).toList()
              return  ListView.builder(
              itemCount: proposals.length,
              itemBuilder: (context, index) {
                return proposal_sent(
                  name: 'Mohith',
                  description: proposals[index]['description'],
                  id:proposals[index]['_id']
                );
              },
                          );
            }
          }}
      ),
    );
  }
}

class proposal_sent extends StatelessWidget {
  const proposal_sent({super.key,required this.name, required this.description, required this.id});

  final String name;
  final String description;
  final String id;

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
                    'name',
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
                      child: Text('description',
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
           Positioned(
              top: 10,
              right: 10,
              child: Row(
                children: [
                  InkWell(
                    onTap: ()async{
                      response = await dio.put('/proposal/reject/$id');
                      print(response?.data);
                      
                    },
                    child: const ColoredBox(color: Colors.redAccent, child: Icon(Icons.close)
                  )),
                  SizedBox(width: 12),
                  InkWell(
                    onTap: ()async{
                      response = await dio.put('/proposal/accept/$id');
                      print(response?.data);
                    },
                    child: const ColoredBox(
                        color: Colors.lightGreen,
                        child: Icon(Icons.done_outlined)),
                  )
                ],
              )),
        ],
      ),
    );
  }
}