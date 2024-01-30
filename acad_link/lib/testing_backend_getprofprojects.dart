import 'package:dio/dio.dart';

void main(){
  getprofessorprojectposts();
}

Future<void> getprofessorprojectposts() async{
     final Dio _dio = Dio(BaseOptions(
        baseUrl: 'https://c423-103-37-201-174.ngrok-free.app',
        contentType: 'application/json'
      )
      );
      try{
        Response response = await _dio.get('/posts/profproject');
        print(response.data.runtimeType);
        print(response.data[2]['prof']);
      }on DioException catch(e){
        print(e);
      }
  }