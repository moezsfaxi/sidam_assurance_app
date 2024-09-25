import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Response> send_assurance_voyage({
  required String? nom_voyageur,
  required String? email,
  required String? adresse,
  required String? num_pass,
  required String? destination,
  required String? motif_voyage,
  required String? tel,
  required String? wtsp,
  required String? duree_voyage,
  required String? condition_medical,
  required DateTime? date_depart,
  required DateTime? date_retour,
  required DateTime? date_naissance,
  required String created_at,
}) async {
  final dio = Dio();
  String? api = dotenv.env['private_ip_adress'];
  String? url ='$api/api/assurance-voyage';
  dio.options.headers['Content-Type'] = 'application/json';

  Response response;

  try {
    response = await dio.post(
      //'$api/api/assurance-voyage',
      url,
      data: {
        "nom_voyageur": nom_voyageur,
        "email": email,
        "adresse": adresse,
        "num_pass": num_pass,
        "destination": destination,
        "motif_voyage": motif_voyage,
        "tel": tel,
        "wtsp": wtsp,
        "duree_voyage": duree_voyage,
        "condition_medical": condition_medical,
        "date_depart": date_depart?.toIso8601String(),
        "date_retour": date_retour?.toIso8601String(),
        "date_naissance": date_naissance?.toIso8601String(),
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
