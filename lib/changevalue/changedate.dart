import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:dio/dio.dart';
import 'package:sidam_assurance_app/network_controllers/change_date_controller.dart';
import 'package:sidam_assurance_app/polices_forms/form_sent_success.dart';

class Changedate extends StatefulWidget {
  const Changedate({super.key,required this.theid,required this.typeofanssurance,});
  final  theid;
  final typeofanssurance;

  @override
  State<Changedate> createState() => _ChangedateState();
}

class _ChangedateState extends State<Changedate> {

    final _formKey = GlobalKey<FormState>();
    DateTime? newdate;
    String? _selectedvalueforchange;
  
    List<String> options =['3 mois','6 mois','1 ans','2 ans'];

//begin
  bool _isLoading = false;
  Future<void> _sendtheform() async {
  if (_formKey.currentState!.validate()) {
    setState(() {
      _isLoading = true;
    });
    try {
      Response response = await send_change_date(
        id: widget.theid,
        type_decouverture: widget.typeofanssurance,
        date_fin_couvert: _selectedvalueforchange
    
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
          if (mounted) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const FormSentSuccess()),
              (Route<dynamic> route) => false,
            );
          }  


          
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
    return  Scaffold(
      appBar:const AppBarwidget(isHome: true),
      body:  SingleChildScrollView(
      child: Form(
        key: _formKey,
        child:  Column(
       children:  [
        const FormLabels(labelForm: "combien d années voulez vous ajouter?"),
        DropDownMenuForm(
        selectedValue: _selectedvalueforchange,
        items: options,
        onChanged: (value){
        setState(() {
          _selectedvalueforchange=value;
        });    

        }),
        ElevatedButton(onPressed: (){
          _formKey.currentState!.save();
          _sendtheform();
            


        }, child:_isLoading ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3.0,
                              value: 0.7,) 
                              : const Text("envoyer",
                              style: TextStyle(fontFamily: "Roboto-Medium"),
                              ))
        
        ]

      )),

      ) 

    );
  }
}