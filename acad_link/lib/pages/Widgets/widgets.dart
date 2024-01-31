// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

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
  const  Pbox({super.key, required this.title, required this.name,required this.Requirements});
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fill,
      child: Padding(
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
                    return Dis_box();//need to tell him to adjust this widget, requirements are not in order, have to take skills from that requirements, but not able to take
                  },
                );
                    },
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 80, 20),
                        child: Expanded(
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
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
                      width: 354,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color.fromRGBO(180, 227, 222, 1),
                      ),
                    ),
                  ),
                  Positioned(right: 20, top: 20, child: Apply())
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Apply extends StatelessWidget {
  const Apply({super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Apply_box();
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
  }
}

class Dis_box extends StatelessWidget {
  const Dis_box({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[400],
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/ 1.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Title of the questions',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: MediaQuery.of(context).size.width / 35),
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

class Apply_box extends StatelessWidget {
  const Apply_box({super.key});

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