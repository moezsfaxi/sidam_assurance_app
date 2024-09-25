import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Response> send_assurance_agricole({
  required String? nom_agri,
  required String? adresse,
  required String? email,
  required String? nom_exploitation,
  required String? type_culture,
  required String? SIRET_SIREN,
  required String? tel,
  required String? wtsp,
  required String? superficie,
  required String? val_equipement_agri,
  required String? val_batiment_agri,
  required String? duree_couvert,
  required String? type_exp,
  required String? type_couvert,
  required String date_debut_couvert,
  required String created_at,
  required String activ_couvert
}) async {
  final dio = Dio();
  String? api = dotenv.env['private_ip_adress'];
  dio.options.headers['Content-Type'] = 'application/json';
  String? url ='$api/api/assurance-risque-agricole';
  
  Response response;

  try {
    response = await dio.post(
      //'$api/api/assurance-risque-agricole',
      url,
      data: {
        "nom_agri": nom_agri,
        "adresse": adresse,
        "email": email,
        "nom_exploitation": nom_exploitation,
        "type_culture": type_culture,
        "SIRET_SIREN": SIRET_SIREN,
        "tel": tel,
        "wtsp": wtsp,
        "superficie": superficie,
        "val_equipement_agri": val_equipement_agri,
        "val_batiment_agri": val_batiment_agri,
        "duree_couvert": duree_couvert,
        "type_exp": type_exp,
        "type_couvert": type_couvert,
        "date_debut_couvert": date_debut_couvert,
        "created_at": created_at,
        "activ_couvert": activ_couvert
      },
    );
    return response;
  } on DioException catch (e) {
    print('Error: ${e.response?.statusCode} - ${e.message}');
    if (e.response != null) {
      print('Response data: ${e.response?.data}');
    }
    print('Request data: ${e.requestOptions.data}');
    rethrow;
  }
}
