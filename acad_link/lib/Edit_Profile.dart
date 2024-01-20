import 'package:flutter/material.dart';

class Edit_Profile extends StatelessWidget {
  const Edit_Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromARGB(255, 135, 157, 255),
            // Color(0xffc5eeff),
            Color.fromARGB(255, 239, 251, 255)
          ],
              stops: [
            0.26,
            // 0.27,
            // 0.65,
            0.21
          ])),
        padding: const EdgeInsets.only(left: 18.0, top: 8.0, right: 18),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top:15.0, left: 5),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(7)
                ),
              
                child: InkWell(
                  onTap: () => {},
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.white,             
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 37,),
             Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 67,
                    backgroundColor: Color.fromARGB(255, 239, 251, 255),
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage(
                        'assets/images/OIP.jpeg'
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: (){},
                      child: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 21.2,
                        child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        child: Icon(Icons.add_a_photo_outlined,
                        color: Colors.black,),
                        ),
                      ),
                    ))
                ],
              ),
            ),
           const SizedBox(height: 45,),
           TextFormField(
            initialValue: 'Mohith Reddy',
            decoration: const InputDecoration(
              labelText: 'Name'
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            initialValue: '7.14',
            decoration: const InputDecoration(
              labelText: 'CGPA'
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            initialValue: '9491741155',
            decoration: const InputDecoration(
              labelText: 'Phone Number'
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            initialValue: 'ECE',
            decoration: const InputDecoration(
              labelText: 'Department'
            ),
          ),
          const SizedBox(height: 10,),
          TextFormField(
            initialValue: 'I am the best',
            decoration: const InputDecoration(
              labelText: 'Description'
            ),
          )



          ],
        ),
      ),
    );
  }
}