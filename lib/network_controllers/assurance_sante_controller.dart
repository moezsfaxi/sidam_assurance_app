// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
Future<Response> send_assurance_sante(
  {
    required type_client,
    required prenom,
    required tel,
    required wtsp,
    required email,
    required nom_beneficiaire,
    required date_naissance,
    required num_securite_social,
    required adresse,
    required type_couvert,
    required created_at,
    required activ_couvert        }
) async {
  final dio = Dio();
  Response response;
  dio.options.headers['Content-Type'] = 'application/json';

  try {
    response = await dio.post(
      'http://192.168.1.8:8000/api/assurance-sante',
      data: {
  
  "type_client": type_client,
  "prenom": prenom,
  "tel": tel,
  "wtsp": wtsp,
  "email": email,
  "nom_beneficiaire": nom_beneficiaire,
  "date_naissance": date_naissance,
  "num_securite_social": num_securite_social,
  "adresse": adresse,
  "type_couvert": type_couvert,
  "created_at": created_at,
  "activ_couvert": activ_couvert
},
    );
    
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
