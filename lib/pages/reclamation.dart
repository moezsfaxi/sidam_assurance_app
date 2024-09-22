import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:dio/dio.dart';
import 'package:sidam_assurance_app/network_controllers/reclame_controller.dart';
import 'package:sidam_assurance_app/polices_forms/form_sent_success.dart';

class Reclamation extends StatefulWidget {
  const Reclamation({super.key});

  @override
  State<Reclamation> createState() => _ReclamationState();
}

class _ReclamationState extends State<Reclamation> {
  
  final _formKey = GlobalKey<FormState>();
  String? _sujet;
  String? _details;

  //begin
  bool _isLoading = false;
  Future<void> _sendReclamationForm() async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      _isLoading = true;
    });
    try {
      Response response = await send_assurance_reclamation(
        sujet: _sujet,
        details: _details,
      );

      switch (response.statusCode) {
        case 201:
          if (mounted) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const FormSentSuccess()),
              (Route<dynamic> route) => false,
            );
          }
          break;
        case 404:
        case 401:
          print(response.data);
          break;
        default:
          print("Unexpected status code: ${response.statusCode}");
          break;
      }
    } on DioException catch (e) {
      print(e.error);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}

  //end
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarwidget(isHome: true),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.only(left: 10.0) ,
          child: Form(
            key: _formKey
            ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                children: [
                  const Text("sujet:"),
                  //const SizedBox(width: 15.0,),
                  SizedBox(
                  width: (MediaQuery.of(context).size.width*0.6),
                  child: TextFormField(
                    onSaved: (value){
                      _sujet= value;

                    },
                    decoration:const InputDecoration(
                      hintText: "sujet"
          
                    ),
          
                  ),  
          
                  )
          
                ],
          
          
              ),
              const SizedBox(height: 40.0,)
              
              
              ,
              const Text("les détails:"),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid
        
        
                  )
                ),
                child: TextFormField(
                  onSaved: (value){
                      _details= value;

                    },
                
                  maxLines: 10,
                  decoration:const InputDecoration(
                    hintText: "plus d info"
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                width: 300.0,
                
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     foregroundColor: Colors.white,
                     backgroundColor: Colors.blue   
                  ),
                  onPressed: (){
                  if(_formKey.currentState!.validate()){
                   _formKey.currentState!.save();
                   _sendReclamationForm();
                  }
          
                },
                 child:_isLoading ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3.0,
                              value: 0.7,) 
                              : const Text("evoyé la demane",
                              style: TextStyle(fontFamily: "Roboto-Medium"),
                              ) ),
              )
          
              ],
          
            )
            
            
            
            ),
        ),
      ),
    );
  }
}                          