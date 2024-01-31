import 'package:flutter/material.dart';
import '/pages/Widgets/widgets.dart';
import 'package:acad_link/globals.dart';
class student_projects extends StatefulWidget {
  const student_projects({super.key});

  @override
  State<student_projects> createState() => _student_projectsState();
}

class _student_projectsState extends State<student_projects> {

  List<dynamic> student_project_posts = [];
  Future<void> getprofessorprojectposts() async{
      
         response = await dio.get('/posts/userproject');
        student_project_posts = response?.data??[];
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
            return const Column(
              children: [
                Icon(Icons.signal_wifi_connected_no_internet_4_sharp,size:100),
                Text('check your internet connection'),
                Text('or',style: TextStyle(fontSize: 30),),
                Text('server error, so try later'),
              ],
            );
          } else {
            if(student_project_posts.isEmpty){
              return const Column(
                children: [
                  Text('\u{1F62D}',style: TextStyle(fontSize: 100),),
                  Text('No Posts to display'),
                  Text('come back next time')
                ],
              );
            }else{
              print(student_project_posts);
              // List<String> requirement_list = student_project_posts[0]['requirements']['skills'].map((dynamic item) => item.toString()).toList()
              return ListView.builder(
              itemCount: student_project_posts.length,
              itemBuilder: (context, index) {
                return  Pbox(
                    title:
                    
                      student_project_posts[index]['title'],
                      description:student_project_posts[index]['description'],
                      name: student_project_posts[index]['userName'],
                      Requirements: (student_project_posts[index]['requirements']['skills'] as List<dynamic>).map((e)=>e.toString()).toList(),
                      );
              },
            );
            }
           
          }}  
            ));
  }
}
// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

// import 'package:flutter/material.dart';
// import '../Widgets/widgets.dart';

// List<String> project_name=['dvvv','vccvn'];
// class PS extends StatelessWidget {
//   const PS({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(209, 248, 248, 1),
//       body: Center(
//           child: ListView.builder(
//         itemCount: project_name.length,
//         itemBuilder: (context, index) {
//           return Pbox(
//               title:
//                 project_name[index],
//               name: 'a student',
//               Requirements: ['eruhfukndf','yrgfhufbhbg'],);
//         },
//       )),
//     );
//   }
// }
