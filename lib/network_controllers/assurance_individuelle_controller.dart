import 'package:dio/dio.dart';

Future<Response> send_assurance_individuelle({
  required String? email,
  required String? fonction,
  required String? tel,
  required String? wtsp,
  required String? capital_deces,
  required String? capital_invalidite_permanente,
  required String? montant_frais_medicaux,
  required String created_at,
  required String activ_couvert,
}) async {
  final dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';

  Response response;

  try {
    response = await dio.post(
      'http://192.168.1.8:8000/api/assurance-individuelle-accidents',
      data: {
        "email": email,
        "fonction": fonction,
        "tel": tel,
        "wtsp": wtsp,
        "capital_deces": capital_deces,
        "capital_invalidite_permanente": capital_invalidite_permanente,
        "montant_frais_medicaux": montant_frais_medicaux,
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
