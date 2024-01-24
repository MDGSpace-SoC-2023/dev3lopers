import 'package:dio/dio.dart';

void main()  {
  _login();
}
final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://2bdc-106-205-173-127.ngrok-free.app/',
    contentType: 'application/json',
  ));

  Future<void> _login() async {
    try {
      Response response = await _dio.post('/users/login', data: {
        "email": "profityy12@gmail.com",
        "password": "profity61"
      });

      final authToken = response.data['authToken'];
      print(authToken);
      response = await _dio.post('/users/getuser/', options: Options(headers: {'auth-token':authToken}));
      if(response.data['verfied']){
        print(response.data);
      }else{
        print("User doesn't exist");
      }
    } catch (e) {
      print('Error: $e');
    }
  }