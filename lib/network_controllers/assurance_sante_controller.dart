

// ignore_for_file: avoid_print

import 'package:dio/dio.dart';


Future<void> submitForm({
  required String email,
  required String adresse,
  required String nomPrenom,
  required String nomDuBeneficiaire,
  required String telephone,
  required String whatsapp,
  required String numeroDeSecuriteSociale,
  required String selectedValueForTypedeClient,
  required String selectedValueForTypedecouverture,
  required DateTime? selectedDate,
}) async {
   Dio dio = Dio();
   setupDio(dio);
  try {
    Response response = await dio.get(
      'http://192.168.43.153:8000/sante', 
      data: {
        'email': email,
        'adresse': adresse,
        'nomPrenom': nomPrenom,
        'nomDuBeneficiaire': nomDuBeneficiaire,
        'telephone': telephone,
        'whatsapp': whatsapp,
        'numeroDeSecuriteSociale': numeroDeSecuriteSociale,
        'typeDeClient': selectedValueForTypedeClient,
        'typeDeCouverture': selectedValueForTypedecouverture,
        'dateDeNaissance': selectedDate?.toIso8601String(), // Format the date as needed
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Submission successful!');
      print('Response data: ${response.data}');
      // Handle successful submission
    } else {
      print('Submission failed: ${response.data}');
      // Handle failed submission
    }
  } on DioException catch (e) {
    print('DioException Error: ${e.message}');
    if (e.response != null) {
      print('Status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
    } else {
      print('Network error: ${e.message}');
    }
  } catch (e) {
    print('Unexpected error: $e');
  }
}

void setupDio(Dio dio) {
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    requestBody: true,
    request: true,
    error: true,
  ));
}

Future<void> submitFormtwo({
  required String email,
  required String adresse,
  required String nomPrenom,
  required String nomDuBeneficiaire,
  required String telephone,
  required String whatsapp,
  required String numeroDeSecuriteSociale,
  required String selectedValueForTypedeClient,
  required String selectedValueForTypedecouverture,
  required DateTime? selectedDate,
}) async {
  Dio dio = Dio();
  setupDio(dio);
  
  try {
    Response response = await dio.get(
      'http://192.168.43.153:8000/santetwo',
      queryParameters: {
        'email': email,
        'adresse': adresse,
        'nomPrenom': nomPrenom,
        'nomDuBeneficiaire': nomDuBeneficiaire,
        'telephone': telephone,
        'whatsapp': whatsapp,
        'numeroDeSecuriteSociale': numeroDeSecuriteSociale,
        'typeDeClient': selectedValueForTypedeClient,
        'typeDeCouverture': selectedValueForTypedecouverture,
        'dateDeNaissance': selectedDate?.toIso8601String(), // Format the date as needed
      },
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Submission successful!');
      print('Response data: ${response.data}');
      // Handle successful submission
    } else {
      print('Submission failed: ${response.data}');
      // Handle failed submission
    }
  } on DioException catch (e) {
    print('DioException Error: ${e.message}');
    if (e.response != null) {
      print('Status code: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
    } else {
      print('Network error: ${e.message}');
    }
  } catch (e) {
    print('Unexpected error: $e');
  }
}


/////

///


Future<Response> loginuservalidation(String email, String telephone ) async {
  Dio dio = Dio();

  try {
    Response response = await dio.get(
     // 'http://127.0.0.1:8000/signin',  // Ensure http:// or https:// is included
      'http://192.168.43.153:8000/santetwo',
      data:{

        'email': email,
        'tel': telephone,
      } 
      ,
      options: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );
    //print(response.data);
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
