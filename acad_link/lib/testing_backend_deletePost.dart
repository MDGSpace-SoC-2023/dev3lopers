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
      
      Response response = await _dio.delete('/posts/deletepost/65b50cb74a67e455b5e179bb',  
      options: Options(headers: {'auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1YjRlZGQ5NDZlODM4MGE4MjA5OGYzNCIsImlhdCI6MTcwNjM2MDUxOX0.gBZozEadeleDDkjU2GZp1tE_7NjEVwB9ehsz4pwBitI'}),
      );
      print(response.data);
    } on DioException catch (e) {
      print(e);
    }   
}