// ignore_for_file: avoid_print, unused_local_variable

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';





Future<Response> sendwithdio({required name, required password}) async {
  print(name);
  print(password);

  final dio = Dio();
  String? api = dotenv.env['private_ip_adress'];
  String? url ='$api/api/users';
  Response response;
  dio.options.headers['Content-Type'] = 'application/json';

  try {
    //print('$api/api/users');
    response = await dio.post(
      //'http://192.168.43.153:8000/api/users',
      url,
      data: {
        "name": name,
        "password": password,
      },
    );
    //print(response.data);   // Log the successful response
    return response;
  } on DioException catch (e) {
  // Print full error details for debugging
 
  print('Error: ${e.response?.statusCode} - ${e.message}');
  if (e.response != null) {
    
    print('Response data: ${e.response?.data}');
  }
  
  print('Request data: ${e.requestOptions.data}');
  rethrow;
}
}
