import "package:dio/dio.dart";

final Dio dio = Dio(BaseOptions(baseUrl: 'https://b14b-103-37-201-173.ngrok-free.app',contentType: 'application/json'));
Response? response;

String? authToken;