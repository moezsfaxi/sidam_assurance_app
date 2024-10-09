// ignore_for_file: avoid_print
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
Future<Response> send_change_date(
  {
    required id,
    required date_fin_couvert,
    required type_decouverture
         }
) async {
  final dio = Dio();
  String? api = dotenv.env['private_ip_adress'];
  String typedecouverturestring= getthetyperight(type_decouverture);
  String? url ='$api/api/$typedecouverturestring/$id';
  Response response;
  dio.options.headers['Content-Type'] = 'application/json';

  try {
    response = await dio.put(
      //'$api/api/assurance-sante',
      url,
      data: {
  
       "date_fin_couvert":date_fin_couvert 
},
    );
    
    return response;
  } on DioException catch (e) {
  // Print full error details for debugging
  print('Error: ${e.response?.statusCode} - ${e.message}');
  if (e.response != null) {    
    print('Response data: ${e.response?.data}');
  }
  print('Request data: ${e.requestOptions.data}');
  rethrow;
}
}

String getthetyperight(String type){
if(type =="assurance auto" ){

return "assurance-auto";

}
else if(type == "assurance individuelle"){
return "assurance-individuelle-accidents";
}
else if(type == "assurance habitation"){
return "assurance-multirisque-habitation";
}
else if(type == "assurance pro"){
return "assurance-multirisque-pro";
}
else if(type == "assurance agricole"){
return "assurance-risque-agricole";
}
else if(type == "assurance santé"){
return "assurance-sante";
}
else if(type == "assurance chantiers"){
return "assurance-tousrisques-chantiers";
}
else if(type == "assurance voyage"){
return "assurance-voyage";
}
else if(type == "assurance transport"){
return"assurance-transport" ;
}
else{
  return "not-found";
}





} 