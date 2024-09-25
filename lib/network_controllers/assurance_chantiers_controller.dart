import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Response> send_assurance_tous_risques_chantiers({
  required String? nom_projet,
  required String? type_chantier,
  required String? num_permis_const,
  required String? adresse,
  required String? tel_resp,
  required String? email_resp,
  required String? nom_entrepreneur,
  required String? val_total_projet,
  required String? val_equipements,
  required String? description_travaux,
  required String? type_couvert,
  required String date_debut_travaux,
  required String date_prevue_achevement,
  required String created_at,
  required String activ_couvert,
}) async {
  final dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';
  String? api = dotenv.env['private_ip_adress'];

  Response response;

  try {
    response = await dio.post(
      '$api/api/assurance-tousrisques-chantiers',
      data: {
        "nom_projet": nom_projet,
        "type_chantier": type_chantier,
        "num_permis_const": num_permis_const,
        "adresse": adresse,
        "tel_resp": tel_resp,
        "email_resp": email_resp,
        "nom_entrepreneur": nom_entrepreneur,
        "val_total_projet": val_total_projet,
        "val_equipements": val_equipements,
        "description_travaux": description_travaux,
        "type_couvert": type_couvert,
        "date_debut_travaux": date_debut_travaux,
        "date_prevue_achevement": date_prevue_achevement,
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
