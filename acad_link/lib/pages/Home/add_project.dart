import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:acad_link/globals.dart';
var titleController = TextEditingController();
var descriptionController = TextEditingController();
var skillController= TextEditingController();


class AddProject extends StatefulWidget {
  const AddProject({super.key});

  @override
  State<AddProject> createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
   String? project_title;
   String? description;
   List<String>? skills;

  Future<void> post_project() async{
    response = await dio.post(
      '/posts/createpost',
    data: {
      'title':project_title,
      'description':description,
      'requirements':{
        'skills': skills
      }
    },
    options: Options(headers: {'auth-token':authToken}));
    print(response);
  }

  @override   
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.5 ,
        child: ListView(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: "title of the project"),
              maxLines: 2,
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'decribe about the project'),
              controller: descriptionController,
              maxLines: 5,
            ),
            TextField(
              controller: skillController,
              decoration: const InputDecoration(hintText: 'Skills seperated by \',\''),
              maxLines: 3 ,
            ),
            DatePickerDemo(),
            const SizedBox(height:50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () async{
              try{
                if(titleController.text.isEmpty || descriptionController.text.isEmpty || skillController.text.isEmpty){
                  SnackBar snackBar = const SnackBar(content: Text('fill required feilds', textAlign: TextAlign.center,));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar); 
                }else{
                project_title = titleController.text;
                description = descriptionController.text;
                skills = skillController.text.split(',');
                await post_project();
              SnackBar snackBar = const SnackBar(content: Text('project posted',textAlign: TextAlign.center,));
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              // ignore: use_build_context_synchronously
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                
              }on DioException catch(error){
                SnackBar snackBar = SnackBar(content: Text('${error.response?.statusCode}'));
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.indigo[300],
                  borderRadius: BorderRadius.circular(6)),
              width: 100,
              height: 25,
              child: Center(
                child: Text(
                  'Post',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 6,
          ),
          InkWell(
            onTap: () {
              titleController.clear();
              descriptionController.clear();
              skillController.clear();
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.circular(6)),
              width: 100,
              height: 25,
              child: Center(
                child: Text(
                  'Delete',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      )
          ],
        ),
      ),
    );
  }
}

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: ()
              {
                _selectDate(context);              
              },
              child: Text('choosen deadline ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}'),);
  }
}

