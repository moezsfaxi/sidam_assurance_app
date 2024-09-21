// ignore_for_file: avoid_print

import 'package:dio/dio.dart';





Future<Response> sendwithdio({required name, required password}) async {
  print(name);
  print(password);

  final dio = Dio();
  Response response;
  dio.options.headers['Content-Type'] = 'application/json';

  try {
    response = await dio.post(
      'http://192.168.43.153:8000/api/users',
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
