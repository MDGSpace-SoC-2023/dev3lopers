// ignore_for_file: camel_case_types


import 'package:acad_link/pages/Profile/aplicants_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:acad_link/globals.dart';


// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names
class applications_recieved extends StatelessWidget {
  const applications_recieved({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> posted_projects = [];
    Future<void> get_posted_projects() async{
      response = await dio.get('/posts/myproject', options: Options(headers: {'auth-token': authToken}));
      posted_projects = response?.data??[];
    }

    return Scaffold(
      appBar: AppBar(title: Text('Projects Posted',style: TextStyle(decoration: TextDecoration.none,fontSize: 17),)),
      body: FutureBuilder(future: get_posted_projects(), builder: ((context, snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: const CircularProgressIndicator());
        }else if(snapshot.hasError){
          print(posted_projects);
          print(snapshot.error);
          return Center(
            child: const Column(
               children: [
                    Icon(Icons.signal_wifi_connected_no_internet_4_sharp,size:100),
                    Text('check your internet connection'),
                    Text('or',style: TextStyle(fontSize: 30),),
                    Text('server error, so try later'),
                  ],
            ),
          );
        }else{
          if(posted_projects.isEmpty){
            return Center(
              child: const Column(
                    children: [
                      Text('\u{1F62D}',style: TextStyle(fontSize: 100),),
                      Text('No Posts to display'),
                      Text('try posting a project')
                    ],
                  ),
            );
          }else{
            print(posted_projects);
            return ListView.builder(itemBuilder: (context, index) {
          return _propose(
              title: posted_projects[index]['title'],
              description: posted_projects[index]['description'],
              id : posted_projects[index]['_id'],
              no_of_proposals: posted_projects[index]['no_of_proposals']

            );
      
        },itemCount: posted_projects.length,);
            
          }
        }
      })),
    );
  }
}

class _propose extends StatelessWidget {
  final int no_of_proposals;
  final String title;
  final String description;
  final String id;
  const _propose({super.key, required this.title, required this.description, required this.id, required this.no_of_proposals});
  @override
  Widget build(BuildContext context) {
    return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Stack(children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 80, 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(description,
                              selectionColor:
                                  Color.fromRGBO(209, 248, 248, 1),
                              style: TextStyle(
                                fontSize: 15,
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              )),
                        ),
                      ),
                    ]),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width/2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(180, 227, 222, 1),
              ),
            ),
            Positioned(
              right: 20,
              top: 20,
              child:
                  InkWell(
                    onTap: (){
                      AwesomeDialog(
                dialogType: DialogType.warning,
                btnCancel: ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical:14.0))
                    ),
                  child: const Text('Cancel',style: TextStyle(color: Colors.white),),
                ),
                btnOk: ElevatedButton(
                  onPressed: () async {
                    try{
                      response = await dio.delete('/posts/deletepost/$id',options: Options(headers: {'auth-token':authToken}));
                       print(response?.data);
                       Navigator.pop(context);
                       SnackBar snackBar = SnackBar(content: Text('deleted',textAlign: TextAlign.center,));
                       ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }on DioException catch(error){
                      print(error.response);
                    }
                    
                   
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(255, 23, 68, 1)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical:13.0))
                    ),
                  child: const Text('Delete',style: TextStyle(color: Colors.white),),
                  ),
                width: MediaQuery.of(context).size.width-30,
                context: context,
                body: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child:  const Column(
                    children: [
                      Text('Are u sure to delete mwee'),
                    ],
                  )
                )
              ).show();
                    },
                    child: Container(
                      width: 65,
                      height: 30,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Delete',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            
                            decoration: TextDecoration.none,
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.normal),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red[400],
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
            ),
            Positioned(
              bottom: 30,
              right: 30,
              child: InkWell(
                onTap: ()async{
                 
                  Navigator.push(context,MaterialPageRoute(builder: ((context) => ListOf(id:id))));
                },
                child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue[600],
                      child: Center(
                        child: Text(
                          '$no_of_proposals',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
              ),)
          ]),
        );
  }
}
