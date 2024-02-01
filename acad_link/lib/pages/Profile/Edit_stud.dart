import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:acad_link/globals.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main()
{
  runApp(Edit_Profile());
}

String convert(List<String> s){
    String ans='';
    for(int i=0;i<s.length;i++)
    {
      ans+='${s[i]}\n';
    }
    return ans;
  }

class Edit_Profile extends StatefulWidget {

   Edit_Profile({super.key});

  @override
  State<Edit_Profile> createState() => _Edit_ProfileState();
}

class _Edit_ProfileState extends State<Edit_Profile> {
  

  final _namecontroller = TextEditingController(text:prefs.getString('name'));
  final _cgpacontroller = TextEditingController(text: prefs.getString('cgpa'));
  final _phonenumbercontroller = TextEditingController(text: prefs.getString('mobileNumber'));
  final _departmentcontroller = TextEditingController(text: prefs.getString('department'));
  final _graduationcontroller = TextEditingController();
  final _engagementscontroller = TextEditingController();
  final _yearcontroller  = TextEditingController();
  final _descriptioncontroller = TextEditingController(text: prefs.getString('description'));

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
                    child :Container(
                      height: 160,
                      width:200,
                      child: ProfilePicPicker()),
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
                          // initialValue: '7.14',
                          controller:  _cgpacontroller,
                          decoration: const InputDecoration(
                            labelText: 'CGPA'
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
                            labelText: 'Description',
                            hintText: 'repo links, resume links, your projects, etc...'
                          ),
                        ),
                        const SizedBox(height: 15,),
                         MaterialButton(onPressed: () async{                          
                          try{
                            prefs.setString('name', _namecontroller.text);
                            prefs.setString('mobileNumber', _phonenumbercontroller.text);
                            prefs.setString('department', _departmentcontroller.text);
                            prefs.setString('graduation', _graduationcontroller.text);
                            prefs.setString('year', _yearcontroller.text);
                            prefs.setString('engagements', _engagementscontroller.text);
                            prefs.setString('cgpa', _cgpacontroller.text);
                            prefs.setString('description', _descriptioncontroller.text);
                            response = await dio.put('/profile/saveprofile',
                           data:{
                            'password':prefs.getString('password'),
                              'email':prefs.getString('email'),
                              'role':prefs.getBool('role'),
                              'name':_namecontroller.text,
                              'mobileNumber':_phonenumbercontroller.text,
                              'department':_departmentcontroller.text,
                              'graduation':_graduationcontroller.text,
                              'year':_yearcontroller.text,
                              'engagements':  _engagementscontroller.text.split(','),
                              'cgpa':_cgpacontroller.text,
                              'description':_descriptioncontroller.text,

                           },options: Options(headers: {'auth-token':authToken})
                            );
                            print(response?.data);
                            SnackBar snackBar = const SnackBar(content: Text('saved',textAlign: TextAlign.center,));
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }on DioException catch(error){
                            print(error.response);
                          }
                          print('done');

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

class ProfilePicPicker extends StatefulWidget {
  @override
  _ProfilePicPickerState createState() => _ProfilePicPickerState();
}

class _ProfilePicPickerState extends State<ProfilePicPicker> {
  File? _image;

  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    print(pickedImage?.path);    
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }
  Widget build(BuildContext context) {
    return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor:Color.fromARGB(255, 135, 157, 255),
                  child: _image != null
                      ? Image.file(_image!, fit: BoxFit.cover)
                      : const Text('Please select an image',style: TextStyle(fontSize:12),),
                ),
                const SizedBox(height: 5),
                Center(
                  child: ElevatedButton(
                    onPressed: _openImagePicker,
                    child: const Text('Select An Image',style: TextStyle(fontSize:12)),
                  ),
                )
              ]),
            ),
    );
  }
}