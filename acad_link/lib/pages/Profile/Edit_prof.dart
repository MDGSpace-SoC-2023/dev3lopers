import 'package:flutter/material.dart';

class Edit_Prof extends StatelessWidget {
   Edit_Prof({super.key});
  final _namecontroller = TextEditingController();
  final _phonenumbercontroller = TextEditingController();
  final _departmentcontroller = TextEditingController();
  final _graduationcontroller = TextEditingController();
  final _yearcontroller  = TextEditingController();
  final _engagementscontroller = TextEditingController();
  final _descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 251, 255),
      body: Column(
        children: [
          Container(
           decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 135, 157, 255),
                Color.fromARGB(255, 239, 251, 255)
              ],
                  stops: [
                0.77,
                // 0.27,
                // 0.65,
                0.01
              ])),
            padding: const EdgeInsets.only(left: 18.0, top: 8.0, right: 18),
                child: Column(
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
                        onTap: () => {
                          Navigator.pop(context)
                        },
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
                  const SizedBox(height: 5,),
        ])),
            Expanded(child: 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                        const SizedBox(height: 20,),
                         TextFormField(
                          // initialValue: 'Mohith Reddy',
                          controller: _namecontroller,
                          decoration: const InputDecoration(
                            labelText: 'Name'
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // initialValue: '9491741155',
                          controller:  _phonenumbercontroller,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number'
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // initialValue: 'ECE',
                          controller:  _departmentcontroller,
                          decoration: const InputDecoration(
                            labelText: 'Department'
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          // initialValue: 'undergraduate',
                          controller:  _graduationcontroller,
                          decoration: const InputDecoration(
                            labelText: 'Graduation'
                          ),
                        ),
                        const SizedBox(height: 10,),
                        TextFormField(
                          controller:  _yearcontroller,
                          decoration: const InputDecoration(
                            labelText: 'Year'
                          ),
                        ),
                        const SizedBox(height: 10,),
                         TextField(
                          maxLines: null,
                          controller:  _engagementscontroller,
                          decoration: const InputDecoration(
                            labelText: 'Campus Engagements',
                            hintText: 'clubs you are in and the any other sports events, etc...'
                          ),
                        ),
                        const SizedBox(height: 30,),
                        TextFormField(
                          controller: _descriptioncontroller,
                          // initialValue: 'I am the best',
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Description'
                          ),
                        ),
                        const SizedBox(height: 15,),
                         MaterialButton(onPressed: () {

                        },
                        color: Colors.green[400],
                        child:const Text('Save',style: TextStyle(color: Colors.white),),
                        )
                        ]),
            ))
                      ],
                    ),
    );
  }
}