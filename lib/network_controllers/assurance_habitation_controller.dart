import 'package:dio/dio.dart';

Future<Response> send_assurance_habitation({
  required String? type_client,
  required String? adresse,
  required String? tel,
  required String? wtsp,
  required String? email,
  required String? locataire_proprietaire,
  required String? valeur_immeuble,
  required String? valeur_contenu,
  required String? valeur_degat_eau,
  required String? valeur_bris_glaces,
  required String? valeur_vol,
  required String created_at,
  required String activ_couvert,
}) async {
  final dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';

  Response response;

  try {
    response = await dio.post(
      'http://192.168.1.8:8000/api/assurance-multirisque-habitation',
      data: {
        "type_client": type_client,
        "adresse": adresse,
        "tel": tel,
        "wtsp": wtsp,
        "email": email,
        "locataire_proprietaire": locataire_proprietaire,
        "valeur_immeuble": valeur_immeuble,
        "valeur_contenu": valeur_contenu,
        "valeur_degat_eau": valeur_degat_eau,
        "valeur_bris_glaces": valeur_bris_glaces,
        "valeur_vol": valeur_vol,
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
