
import 'package:flutter/material.dart';


String convert(List<String> s){
    String ans='';
    for(int i=0;i<s.length;i++)
    {
      ans+='${s[i]}\n';
    }
    return ans;
  }


List<String> skills = ['dummy','2324', 'tell me',' don\'t know'];
String branch = 'ECE';
String year = '2';
String mobileNumber = '9491741155';
String about = 'this is about myself';
String name = 'Mohith';
String enrollmentNo = '22116029';
String mail = 'mohith1904@gmail.com';
String cg = '7.14';




class show_profile_student extends StatelessWidget {
  final String mail;
  final String cg;
  final String name;
  final String enrollmentNo;
  final String about;
   final List<String> skills;
   final String branch;
   final String year;
   final String mobileNumber;
  show_profile_student({Key? key,required this.mail,required this.cg,required this.name,required this.enrollmentNo, required this.skills, required this.branch, required this.year, required this.mobileNumber, required this.about});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Center(child: Text('Profile',)), backgroundColor: Colors.blue,shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color(0xffbdcbfe),
              Color.fromARGB(255, 197, 220, 232),
            ],
                stops: [
              0.15,
              0.9
            ])),
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: ListView(
          children:  [
            const SizedBox(height: 16.0),
            const Align(
              child: CircleAvatar(
                radius: 61.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage(
                      'assets/images/OIP.jpeg'),
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            const Center(
              child: Text(
                'Mohith Reddy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lemon',
                
                ),
              ),
            ),
            const Center(
              child: Text(
                '22116029',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Dancing Script',
                  fontWeight: FontWeight.bold,
                )
              ),
            ),
            const SizedBox(height: 35.0),
            const Row(
              children: [
              SizedBox(width: 12.0),
              Icon(Icons.mail_outline_rounded,
              size: 30,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 3.0),
                child: Text(
                  '    mohith1904@gmail.com',                
                ),
              )],
            ),
            const SizedBox(height: 10.0),
             Row(
              children: [
                const SizedBox(width: 12.0),               
                Image.asset(
                  'assets/images/icons8-cg-32.png',
                ),
                const SizedBox(width: 20.0,),
                const Text(
                  '7.15',
                  style: TextStyle(
                    
                  ),
                )
            ],),
            const SizedBox(height: 10,),
            Row(
              children: [
                
                 const SizedBox(width: 18.0),               
                const Icon(Icons.phone),
                const SizedBox(width: 20.0,),
                 Text(
                  '$mobileNumber',
                  style: const TextStyle(
                    
                  ),
                )
            ],),
            const Divider(
              height: 25,
              thickness: 1,
              color: Colors.grey,

            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal:18.0),
              child: Text('Skills:',style: TextStyle(decoration: TextDecoration.underline,fontStyle: FontStyle.italic, fontSize: 15),),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 65,vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(convert(skills))
            ]),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:22.0),
              child: Text('Branch:  $branch',),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:22.0),
              child: Text('year: $year'),
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal:22.0),
              child:  Text('About:',style: TextStyle(fontStyle: FontStyle.italic,decoration: TextDecoration.underline,fontSize: 15) ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 20.0),
              child: Text('$about'),
            ),


            
            
           
           const SizedBox(height: 20,)
            // Add more profile details as needed
          ],
        ),
      ),
    );
  }
}


