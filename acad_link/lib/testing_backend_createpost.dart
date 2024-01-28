import 'package:dio/dio.dart';

void main() async{
  trail();
}

Future<void> trail() async{
    final Dio _dio =  Dio(BaseOptions(
      baseUrl: 'https://68b3-103-37-201-178.ngrok-free.app/',
      contentType: 'application/json'
    ));
    try{
      final email = "dummy19044@gmail.com";
      final pass = "MohithReddy";
      final name = "Mohith Reddy";
      Response response = await _dio.post('/posts/createpost', 
      options: Options(headers: {'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YjRlZGQ5NDZlODM4MGE4MjA5OGYzNCIsImlhdCI6MTcwNjM2MDUxOX0.gBZozEadeleDDkjU2GZp1tE_7NjEVwB9ehsz4pwBitI'}),
      data: {
        'title':name,
        'description': pass,
        'requirements':  {
          'branch':'ECE',
          'year': 2,
          'skills': ["Athlete", "Robot Maker", "webdeveloper"],
          'cgpa': 8.9,
        },
        // 'expiryDate': '2024-01-27T00:00:00.000Z'              
      });
      print(response.data);
    } on DioException catch (e) {
      print(e);
    }   
}