import 'package:flutter/material.dart';
import '/pages/Widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:acad_link/globals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class prof_projects extends StatefulWidget {
  const prof_projects({super.key});

  @override
  State<prof_projects> createState() => _prof_projectsState();
}

class _prof_projectsState extends State<prof_projects> {

  List<dynamic> professor_project_posts = [];
  Future<void> getprofessorprojectposts() async{
      
         response = await dio.get('/posts/profproject',options: Options(headers: {'auth-token':authToken}));
          professor_project_posts = response?.data??[];
        
    }
    void init(){
      super.initState();
      getprofessorprojectposts();

    }
  @override
  Widget build(BuildContext context) {
    return Center(
            child: FutureBuilder(
              future: getprofessorprojectposts(),
              builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator(); 
                      } else if (snapshot.hasError) {
            print(snapshot.error);
            return const Column(
              children: [
                Icon(Icons.signal_wifi_connected_no_internet_4_sharp,size:100),
                Text('check your internet connection'),
                Text('or',style: TextStyle(fontSize: 30),),
                Text('server error, so try later'),
              ],
            );
                      } else {
            if(professor_project_posts.isEmpty){
              return const Column(
                children: [
                  Text('\u{1F62D}',style: TextStyle(fontSize: 100),),
                  Text('No Posts to display'),
                  Text('come back next time')
                ],
              );
            }else{
              print(professor_project_posts);
              // List<String> requirement_list = professor_project_posts[0]['requirements']['skills'].map((dynamic item) => item.toString()).toList()
              return  Stack(
                children: [
                  ListView.builder(
                  itemCount: professor_project_posts.length,
                  itemBuilder: (context, index) {
                    return  Pbox(
                        title:
                          professor_project_posts[index]['title'],
                          name: professor_project_posts[index]['userName'],
                          Requirements: (professor_project_posts[index]['requirements']['skills'] as List<dynamic>).map((e)=>e.toString()).toList(),
                          description: professor_project_posts[index]['description'],
                          apply_status: !professor_project_posts[index]['isApplied'],
                          id:professor_project_posts[index]['_id'],
                          );
                  },
                              ),
                              Positioned( top: 10,
              right: 10,
              child:FloatingActionButton(onPressed: (){
                setState(() {
                  getprofessorprojectposts();
                });
              },
            child: Icon(Icons.refresh, color: Colors.green,),
            ),  )
                ],
              );
            }
                       
                      }}  
            ));
  }
}

