
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:sidam_assurance_app/selectiveDTOS/my_polices_record.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<AssuranceRecord>> requestwithdio({required email}) async{
 final dio = Dio(); 
 String? api = dotenv.env['private_ip_adress'];
 
  String? url ='$api/api/assurance/$email/all-the-active-police';
  print(url);
 Response response;
 try{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? prefemail = prefs.getString('user_email');
  print('User email: $prefemail'); 

 response = await dio.get(url);
 List<dynamic> responseData = response.data;
 List<AssuranceRecord> assurances = responseData.map((data) {
      return AssuranceRecord.fromJson(data);
    }).toList();
    
return assurances ;

 } on DioException catch (e) {
    // Handle Dio errors here
    if (e.response != null) {
      // The server responded with an error status code
      print('Error: ${e.response?.statusCode}, ${e.response?.data}');
    } else {
      // Something happened in setting up or sending the request that triggered an error
      print('Error: ${e.message}');
    }
     return [];
  } catch (e) {
    // Handle any other type of error
    print('Unexpected error: $e');
     return [];
   
  }
}

void printingassuaren(assurance) {
      print('Montant Total: ${assurance.montantTotal}');
      print('Premier Paiement: ${assurance.paiement}');
      print('Type Assurance: ${assurance.type_assurance}');
    }