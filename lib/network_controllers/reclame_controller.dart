import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<Response> send_assurance_reclamation({
  required String? sujet,
  required String? details,
}) async {
  final dio = Dio();
  dio.options.headers['Content-Type'] = 'application/json';
  String? api = dotenv.env['private_ip_adress'];
  String? url ='$api/api/reclamation-client';

  Response response;

  try {
    response = await dio.post(
     // '$api/api/reclamation-client',
     url,
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
