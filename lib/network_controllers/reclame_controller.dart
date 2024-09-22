import 'package:dio/dio.dart';

Future<Response> send_assurance_reclamation({
  required String? sujet,
  required String? details,
}) async {
  final dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';

  Response response;

  try {
    response = await dio.post(
      'http://192.168.1.8:8000/api/reclamation-client',
      data: {
        "sujet": sujet,
        "details": details,
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
