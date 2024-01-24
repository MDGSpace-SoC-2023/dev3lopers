
import 'package:dio/dio.dart';

void main() async{
  trail();
}

Future<void> trail() async{
    final Dio _dio = Dio(BaseOptions(
      baseUrl: 'https://9f18-103-37-201-173.ngrok-free.app',
      contentType: 'application/json'
    ));
    try{
      Response response = await _dio.post('/ping',options: Options(headers: {}));
      print(response.data);
    }catch(error){
      print(error);
    }
    
} 