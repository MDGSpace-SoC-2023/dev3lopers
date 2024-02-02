// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:acad_link/globals.dart';
import 'package:acad_link/pages/Home/HomePage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:acad_link/pages/Profile/project_applied.dart';
var description =TextEditingController();

 String convert(List<String> s){
    String ans='';
    for(int i=0;i<s.length;i++)
    {
      ans+='${s[i]}\n';
    }
    return ans;
  }

class Pbox extends StatelessWidget {
  final String title;
  final String name;
  final List<String> Requirements;
  final String description;
  final bool apply_status;
  final String id;
  
    Pbox({super.key,required this.id, required this.title, required this.name,required this.Requirements, required this.description, required this.apply_status});

  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(children: [
               InkWell(
                onTap: (){ 
                },
                child: CircleAvatar(radius: 12,backgroundImage: AssetImage('assets/images/Mail.png'),)),
               SizedBox(width: 4,),
               Text(name,style: TextStyle(fontSize: 14),)
            ],),
          ),
          Column(
            children: [
              Stack(children: [
                GestureDetector(
                  onTap: (){
                     showDialog<void>(
                context: context,
                builder: (BuildContext context) {
                  return show_project(title: title,description: description,requriements: Requirements,);//need to tell him to adjust this widget, requirements are not in order, have to take skills from that requirements, but not able to take
                },
              );
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 80, 20),
                      child: Expanded(
                        child: SingleChildScrollView(
                          // scrollDirection: Axis.horizontal,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(title,
                                  style: TextStyle(fontSize: 17),),
                                  Text(convert(Requirements),
                                    overflow: TextOverflow.ellipsis,
                                      selectionColor:
                                          Color.fromRGBO(209, 248, 248, 1),
                                      style: TextStyle(
                                         fontSize: 14,
                                        decoration: TextDecoration.none,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromRGBO(180, 227, 222, 1),
                    ),
                  ),
                ),
                Positioned(right: 20, top: 20, child: Apply(apply_status: apply_status,id:id))
              ]),
            ],
          ),
        ],
      ),
    );
  }
}

class show_project extends StatelessWidget {
  const show_project ({super.key, required this.requriements, required this.title, required this.description});
  
  final List<String> requriements;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(13.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Text(title,style: TextStyle(fontFamily: 'lemon'),),),
              Divider(height: 4,),
              Text('requirements:',style: TextStyle(fontStyle: FontStyle.italic,decoration: TextDecoration.underline),),
              Text(convert(requriements)),
              Divider(height: 6,),
              Text('Description',style: TextStyle(fontFamily: 'lemon'),),
              Text(description)
          ]),
        ),
      ),
    );
  }
}

class Apply extends StatefulWidget {
  final String id;
  final bool apply_status;
  const Apply({super.key, required this.apply_status, required this.id});

  @override
  State<Apply> createState() => _ApplyState();
}

class _ApplyState extends State<Apply> {
  @override
  Widget build(BuildContext context) {
     if(widget.apply_status==true){
       return InkWell(
      onTap: () {
        showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Apply_box(id:widget.id);
                  },
                );
      },
      child: Container(
        child: Center(
            child: Text(
          'apply',
          style: TextStyle(
            color: Colors.white,
          ),
        )),
        width: 60,
        height: 30,
        decoration: BoxDecoration(
            color: Colors.blue[400], borderRadius: BorderRadius.circular(24)),
      ),
    );
  }else{
     return Container(
       child: Center(
           child: Text(
         'applied',
         style: TextStyle(
           color: Colors.white,
         ),
       )),
       width: 70,
       height: 30,
       decoration: BoxDecoration(
           color: Colors.blueGrey[400], borderRadius: BorderRadius.circular(24)),
     );
  }
   
  }
}

class Apply_box extends StatefulWidget {
  const Apply_box({super.key, required this.id});
  final String id;

  @override
  State<Apply_box> createState() => _Apply_boxState();
}

class _Apply_boxState extends State<Apply_box> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(fit: StackFit.passthrough, children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 1.5,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Title',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: MediaQuery.of(context).size.width / 35),
              ),
              TextField(
                controller: description,
                maxLines: 7,
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
          right: MediaQuery.of(context).size.width/4,
          bottom: 10,
          child: Row(
            children: [
              GestureDetector(
                onTap: () async{
                  try{
                    response = await dio.post('/posts/submitpost/${widget.id}',
                  data: {
                    'description': description.text,
                    'isAccepted': false,
                    'isRejected':false,
                  },
                  
                  options: Options(headers: {'auth-token':authToken})
                  );
                   SnackBar snackBar = SnackBar(content: Text('applied successfully',textAlign: TextAlign.center,));
                   
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                   Navigator.of(context).pop();
                  
                  }on DioException catch(error){
                    dynamic error_response_code = error.response?.statusCode;
                    SnackBar snackBar = SnackBar(content: Text('$error_response_code',textAlign: TextAlign.center,));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                  // Navigator.of(context).pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 77, 94, 181),
                      borderRadius: BorderRadius.circular(6)),
                  width: 50,
                  height: 25,
                  child: Center(
                    child: Text(
                      'Apply',
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
    );
  }
}