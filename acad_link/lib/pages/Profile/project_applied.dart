import "package:flutter/material.dart";
import "dart:math";
import 'package:awesome_dialog/awesome_dialog.dart';

String convert(List<String> s){
    String ans='';
    for(int i=0;i<s.length;i++)
    {
      ans+='${s[i]}\n';
    }
    return ans;
  }

void main() => runApp(const applied());

class applied extends StatelessWidget {
  const applied({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
        backgroundColor: Colors.blue,
        title:const Text('Projects Applied',),
      ),

      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context,index )
        {
          return projects_applied(title: 'My project', requriements: {'cgpa':7,'skills':['mohith','dummy','420','722498']}, description: 'this is description');
        },
      ),
    );
  }
}

class projects_applied extends StatelessWidget {
  projects_applied({super.key,required this.requriements,required this.title,required this.description});
  final Map<String,dynamic> requriements;
  final String title;
  final String description;
  
  final List<Color> _boxColor = [ Colors.red, Colors.green, Colors.blue, Colors.white, Colors.orange, Colors.pink, Colors.blueGrey, Colors.yellow];
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return show_project(requriements: requriements, title: title,description: description, );
                  },
                );
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: _boxColor[Random().nextInt(_boxColor.length)]
          ),
          width: MediaQuery.of(context).size.width -20,
          height: (MediaQuery.of(context).size.width)/2-10,
          child: Stack(
            children: [SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  const Center(child: Text('this is title',style:TextStyle(fontFamily: 'lemon'),)),
                  const Divider(height:4),
                 const Text('Requirements:', style: TextStyle(decoration: TextDecoration.underline,fontSize: 14,fontStyle: FontStyle.italic),),
                  Text(convert(requriements['skills']))
                 ],),
            ),
            Positioned(
              top: 35,
              right: 15,
              child: Container(
                height: 25,
                width: 65,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.indigo[50],),
              child: const Text('Edit',textAlign: TextAlign.center,),
            )),
            Positioned(
              bottom: 15,
              right: 10,
              child: InkWell(
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
                  onPressed: ()  {

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(255, 23, 68, 1)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical:13.0))
                    
                    ),
                  
                  child: const Text('UNSEND',style: TextStyle(color: Colors.white),),
                  ),
                width: MediaQuery.of(context).size.width-30,
                context: context,
                body: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child:  const Column(
                    children: [
                      Text('Are u sure to leave this project'),
                    ],
                  )
                )
              ).show();
                },
                child: Container(
                height: 30,width: 80,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                child: const Text('UnSend',textAlign: TextAlign.center,),
                            ),
              ))
            ]
          ),
        ),
      ),
    );
  }
}



class show_project extends StatelessWidget {
  const show_project ({super.key, required this.requriements, required this.title, required this.description});
  
  final Map<String,dynamic> requriements;
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
              Center(child: Text('This is title',style: TextStyle(fontFamily: 'lemon'),),),
              Divider(height: 4,),
              Text('requirements:',style: TextStyle(fontStyle: FontStyle.italic,decoration: TextDecoration.underline),),
              Text(convert(requriements['skills'])),
              Divider(height: 6,),
              Text('Description',style: TextStyle(fontFamily: 'lemon'),),
              Text(description)
          ]),
        ),
      ),
    );
  }
}