import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Response> send_assurance_transport({
  required String? nom_entreprise_transp,
  required String? type_transport,
  required String? adresse,
  required String? email,
  required String? SIRET_SIREN,
  required String? nature_marchandises,
  required String? tel,
  required String? wtsp,
  required String? mode_transport,
  required String? duree_estimee_transp,
  required String created_at,
}) async {
  final dio = Dio();
  
  dio.options.headers['Content-Type'] = 'application/json';
  String? api = dotenv.env['private_ip_adress'];
  String? url ='$api/api/assurance-transport';
  Response response;

  try {
    response = await dio.post(
      //'$api/api/assurance-transport',
      url,
      data: {
        "nom_entreprise_transp": nom_entreprise_transp,
        "type_transport": type_transport,
        "adresse": adresse,
        "email": email,
        "SIRET_SIREN": SIRET_SIREN,
        "nature_marchandises": nature_marchandises,
        "tel": tel,
        "wtsp": wtsp,
        "mode_transport": mode_transport,
        "duree_estimee_transp": duree_estimee_transp,
        "created_at": created_at
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
