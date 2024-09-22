// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/date_picker_for_the_form.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';
import 'package:sidam_assurance_app/network_controllers/assurance_sante_controller.dart';
import 'package:sidam_assurance_app/polices_forms/form_sent_success.dart';

class AssuranceSante extends StatefulWidget {
  const AssuranceSante({super.key});

  @override
  State<AssuranceSante> createState() => _AssuranceSanteState();
}

class _AssuranceSanteState extends State<AssuranceSante> {

  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _adresse;
  String? _NomPrenom;
  String? _Nomdubeneficiaire;
  String? _telephone;
  String? _whatsapp;
  String? _Numerodesecuritesociale;
  String?   _selectedValueForTypedeClient;
  String?   _selectedValueForTypedecouverture;
  DateTime? _selectedDate;
  final TextEditingController _ddnController= TextEditingController();




  String? myvalidation(String? value){
               if(value!.isEmpty){
                return "please enter some text";
      
               } 
               return null;
            }
  
    //begin
    bool _isLoading = false;

  Future<void> _sendtheform() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
       Response response = await send_assurance_sante(
        email: _email,
        adresse: _adresse,
        tel: _telephone,
        wtsp: _whatsapp,
        prenom: _NomPrenom,
        nom_beneficiaire: _Nomdubeneficiaire,
        num_securite_social: _Numerodesecuritesociale,
        type_client: _selectedValueForTypedeClient,
        type_couvert: _selectedValueForTypedecouverture,
        date_naissance: _selectedDate!.toIso8601String() ,
        activ_couvert: "inactive",
        created_at:  DateTime.now().toIso8601String(),);
       
        switch (response.statusCode) {
      case 201:
        if(mounted){

         Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => const FormSentSuccess()),
    (Route<dynamic> route) => false, // This removes all previous routes
  ); 
        }
        break;
      case 404:
        print(response.data);
        break;
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
    return  Scaffold(
      appBar: const AppBarwidget(isHome: true),
      body: SingleChildScrollView(
        child:Form(
          key: _formKey
          ,
          child:  Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const SizedBox(height: 25.0),
             const FormLabels(labelForm: "Type de client"),
             DropDownMenuForm(
                  selectedValue: _selectedValueForTypedeClient,
                  items: const['option1','option2','option3'],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForTypedeClient = newValue;
                      });
                    },),
                  
             const FormLabels(labelForm: "Téléphone"),
             Numberfields(
              onSaved: (value){
                  _telephone=value;
                },
                hint: "Numéro de téléphone",
                myfunction: myvalidation),
             const FormLabels(labelForm: "E-mail"),
             Customizedtextformfield(
                onSaved: (value){
                  _email=value;
                },
                hint: "E-mail",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "Date de naissance"),
             DatePickerForTheForm(
                  selectedDate: _selectedDate,
                  dateController: _ddnController,
                  onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDate=pickedDate;
                      _ddnController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }),
             const FormLabels(labelForm: "Adresse"),
             Customizedtextformfield(
                onSaved: (value){
                  _adresse=value;
                },
                hint: "Adresse",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "Nom & Prénom"),
             Customizedtextformfield(
               onSaved: (value){
                  _NomPrenom=value;
                },
                hint: "Nom & Prénom",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "WhatsApp"),
             Numberfields(
              onSaved: (value){
                  _whatsapp=value;
                },
                hint: "Numéro WhatsApp",
                myfunction: myvalidation),
             const FormLabels(labelForm: "Nom du bénéficiaire"),
             Customizedtextformfield(
                onSaved: (value){
                  _Nomdubeneficiaire=value;
                },
                hint: "Nom du bénéficiaire",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "Numéro de sécurité sociale"),
             Numberfields(
              onSaved: (value){
                  _Numerodesecuritesociale=value;
                },
                hint: "Numéro de sécurité sociale",
                myfunction: myvalidation),
             const FormLabels(labelForm: "Type de couverture"),
              DropDownMenuForm(
                  selectedValue: _selectedValueForTypedecouverture,
                  items: const['option1','option2','option3'],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForTypedecouverture = newValue;
                      });
                    },       
                    )
                 ,
                 SizedBox(
                      width: double.infinity,
                      //padding:const EdgeInsets.only(left: 5.0),
                      //margin: const EdgeInsets.only(left: 5.0),
                      child: ElevatedButton(onPressed: (){
                        
                         _formKey.currentState!.save();
                         _sendtheform(); 
              
              
                      },
                      style: ElevatedButton.styleFrom(
                         foregroundColor: Colors.white,
                         backgroundColor: Colors.blue
            
            
                      ),
                       child:_isLoading ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3.0,
                              value: 0.7,) 
                              : const Text("evoyé la demane",
                              style: TextStyle(fontFamily: "Roboto-Medium"),
                              )
                       ),      
              
              
                      )
             
                              ],
                    ),
          )) ,
      
      ),
    );
  }
}     