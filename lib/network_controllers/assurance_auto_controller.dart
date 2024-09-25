// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';






Future<Response> send_assurance_auto(
  {
    required email,
    required adresse,
    required marque,
    required modele,
    required tel,
    required wtsp,
    required immatriculation,
    required valeur_a_neuf,
    required valeur_venale,
    required type_client,
    required type_de_vehicule,
    required type_de_carburant,
    required date_de_premiere_mise_en_circulation,
    required created_at,
    required activ_couvert        }



) async {
 

  final dio = Dio();
  String? api = dotenv.env['private_ip_adress'];
  String? url ='$api/api/assurance-auto';

  Response response;
  dio.options.headers['Content-Type'] = 'application/json';

  try {
    response = await dio.post(
      //'$api/api/assurance-auto',
      url,
      data: {
  
  "type_client": type_client,
  "type_vehicule": type_de_vehicule,
  "type_carburant":type_de_carburant,
  "valeur_a_neuf":valeur_a_neuf,
  "valeur_venale":valeur_venale,
  "marque":	marque,
  "modele":modele,
  "immatriculation":immatriculation,
  "date_premiere_mise_en_circulation":date_de_premiere_mise_en_circulation,
  "tel": tel,
  "wtsp": wtsp,
  "email": email,
  "adresse": adresse,
  "created_at": created_at,
  "activ_couvert": activ_couvert
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
