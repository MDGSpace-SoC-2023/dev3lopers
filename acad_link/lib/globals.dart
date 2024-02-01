import 'dart:io';
import "package:dio/dio.dart";
import 'package:shared_preferences/shared_preferences.dart';


final Dio dio = Dio(BaseOptions(baseUrl: 'https://e3f1-103-37-201-178.ngrok-free.app/',contentType: 'application/json'));
Response? response;

String authToken = '';
late SharedPreferences prefs;