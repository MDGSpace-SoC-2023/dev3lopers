import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Profile(),
  ));
}

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            InkWell(
              onTap:() {},
              child: const Text(
                '\u{2190} Back',
                style: TextStyle(
                  fontFamily:  'pacifico',
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 36.0),
            const Align(
              child:  CircleAvatar(
                radius: 64.0,
                backgroundImage: AssetImage('assets/images/OIP.jpeg'),
                child: CircleAvatar(
                  radius: 62.0,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 60.0,
                    backgroundImage: AssetImage('assets/images/OIP.jpeg'),
                  ),
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
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 79, 75, 155),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                  )
                ),
                onPressed: () {}, 
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
            ),
            const Divider(
              thickness: 1.0,
              height: 80.0,
              color: Color.fromARGB(255, 230, 230, 230),
            ),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
              child: const Row(
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
                  )
                ]
              )
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
              child: const Row(
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
              )
            ),
            const SizedBox(height: 20),
            TextButton(onPressed: (){},
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            child: const Row(
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

            ) ),
            const SizedBox(height: 20),
            TextButton(onPressed: (){},
            style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.black)),
            child: const Row(
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
                  )
              ],

            ) )
        
            // Add more profile details as needed
          ],
        ),
      ),
    );
  }
}
