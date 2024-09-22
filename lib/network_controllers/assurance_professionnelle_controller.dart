import 'package:dio/dio.dart';

Future<Response> send_assurance_professionnelle({
  required String? nom_entreprise,
  required String? type_activite,
  required String? adresse,
  required String? email,
  required String? nom_resp,
  required String? SIRET_SIREN,
  required String? tel,
  required String? wtsp,
  required String? nbr_emp,
  required String? chiffre_aff_annuel,
  required String? valeur_biens_assures,
  required String? description_locaux,
  required String created_at,
  required String activ_couvert,
}) async {
  final dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';

  Response response;

  try {
    response = await dio.post(
      'http://192.168.1.8:8000/api/assurance-multirisque-pro',
      data: {
        "nom_entreprise": nom_entreprise,
        "type_activite": type_activite,
        "adresse": adresse,
        "email": email,
        "nom_resp": nom_resp,
        "SIRET_SIREN": SIRET_SIREN,
        "tel": tel,
        "wtsp": wtsp,
        "nbr_emp": nbr_emp,
        "chiffre_aff_annuel": chiffre_aff_annuel,
        "valeur_biens_assures": valeur_biens_assures,
        "description_locaux": description_locaux,
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
