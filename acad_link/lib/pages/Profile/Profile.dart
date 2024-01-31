import 'package:acad_link/globals.dart';
import 'package:acad_link/pages/Profile/project_applied.dart';
import 'package:acad_link/pages/QnA/all_question.dart';
import 'package:acad_link/pages/Signup/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Edit_stud.dart';
import '../Profile/projects_posted.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class Profile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
             Center(
              child: Text(
                prefs.getString('name')??'mohith',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Lemon',
                
                ),
              ),
            ),
             Center(
              child: Text(
                prefs.getString('enrollmentNumber')??'22116029',
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
                  'mohith1904@gmail.com',                
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
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      )
                    ),
                    onPressed: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context)=> Edit_Profile()));
                    }, 
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 58.0,vertical: 5.0),
                      child: Text(
                        'Edit',
                        style: TextStyle(
                          color: Colors.white
                        ),
                      ),
                    )
                  ),
                ],
              ),
              
            ),
            const Divider(
              thickness: 1.0,
              height: 20.0,
              color: Color.fromARGB(255, 230, 230, 230),
            ),
            TextButton(
              onPressed: () {Navigator.push(context,MaterialPageRoute(builder: (context)=>const applied()));},
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
              child:  const Padding(
                padding:  EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.pages_outlined,
                      size: 30.0
                    ),
                    SizedBox(width: 20,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        'projects applied',
                      ),
                    ),
                  ]
                ),
              )
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const applications_recieved()));
              },
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
              child:  const Padding(
                padding:  EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.pages_outlined,
                      size: 30.0
                    ),
                    SizedBox(width: 20,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        'projects Posted',
                      ),
                    )
                  ]
                ),
              )
            ),
            TextButton(onPressed: (){},
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            child: const Padding(
              padding:  EdgeInsets.symmetric(vertical: 10),
              child:  Row(
                children: [
                  Icon(
                    Icons.support_agent_outlined,
                    size:32
                  ),
                  SizedBox(width: 20,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        'Support',
                      ),
                    )
                ],
              
              ),
            ) ),
            TextButton(onPressed: (){},
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            child: const Padding(
              padding:   EdgeInsets.only(top:10, bottom:10,),
              child:  Row(
                children: [
                  Icon(
                    Icons.group_outlined,
                    size:32
                  ),
                  SizedBox(width: 20,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        'About Us',
                      ),
                    ),
                ],
              ),
            ) ),
            TextButton(onPressed: () async {
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
                        SharedPreferences prefs = await SharedPreferences.getInstance();
                        prefs.setBool('isLoggedIn', false);
                        prefs.setString('authToken', '');
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                      print(prefs.get('isLoggedIn'));

                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(255, 23, 68, 1)),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(vertical:13.0))
                    
                    ),
                  
                  child: const Text('LOGOUT',style: TextStyle(color: Colors.white),),
                  ),
                width: MediaQuery.of(context).size.width-30,
                context: context,
                body: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child:  const Column(
                    children: [
                      Text('Are u leawing mwee'),
                    ],
                  )
                )
              ).show();

            },
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            child:const Padding(
              padding:  EdgeInsets.only(top:10,right: 10,bottom: 10),
              child:  Row(
                children: [
                  Icon(
                    Icons.logout,
                    color: Colors.red,
                    size:29
                  ),
                  SizedBox(width: 20,),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        'LOGOUT',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ) ),
           const SizedBox(height: 15,)
            // Add more profile details as needed
          ],
        ),
      ),
    );
  }
}


