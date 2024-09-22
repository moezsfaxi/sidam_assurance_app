import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';
import 'package:dio/dio.dart';
import 'package:sidam_assurance_app/network_controllers/assurance_habitation_controller.dart';
import 'package:sidam_assurance_app/polices_forms/form_sent_success.dart';


class AssuranceHabitation extends StatefulWidget {
  const AssuranceHabitation({super.key});

  @override
  State<AssuranceHabitation> createState() => _AssuranceHabitationState();
}

class _AssuranceHabitationState extends State<AssuranceHabitation> {
  
  final _formKey= GlobalKey<FormState>();
  String? _email ;
  String? _adresse ;
  String? _telephone;
  String? _whatsapp;
  String? _Valeurimmeuble;
  String? _ValeurContenu;
  String? _ValeurDegatsdesEaux;
  String? _ValeurBrisdeGlaces;
  String? _valeurvol;
  String? _selectedValueForTypedeclient;
  String? _selectedValueForproprietaireoulocataire;

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
      Response response = await send_assurance_habitation(
        type_client: _selectedValueForTypedeclient,
        adresse: _adresse,
        tel: _telephone,
        wtsp: _whatsapp,
        email: _email,
        locataire_proprietaire: _selectedValueForproprietaireoulocataire,
        valeur_immeuble: _Valeurimmeuble,
        valeur_contenu: _ValeurContenu,
        valeur_degat_eau: _ValeurDegatsdesEaux,
        valeur_bris_glaces: _ValeurBrisdeGlaces,
        valeur_vol: _valeurvol,
        created_at: DateTime.now().toIso8601String(),
        activ_couvert: "inactive",
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
        child: Form(
          key: _formKey,
          child:  Container(
            color: Colors.white,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
                  
              const FormLabels(labelForm: "Type de client"),
                DropDownMenuForm(
                  selectedValue: _selectedValueForTypedeclient,
                  items: const['option1','option2','option3'],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForTypedeclient = newValue;
                      });
                    },
                      
                    
                    )
                 ,
              const FormLabels(labelForm: "Téléphone"),
              Numberfields(
                onSaved: (value){
                  _telephone=value;
                },
                hint: "Numéro de téléphone",
                myfunction: myvalidation),
              const FormLabels(labelForm: "WhatsApp"),
              Numberfields(
                 onSaved: (value){
                  _whatsapp=value;
                },
                hint: "Numéro WhatsApp",
                myfunction: myvalidation),
              const FormLabels(labelForm: "E-mail"),
              Customizedtextformfield(
                onSaved: (value){
                  _email = value;  
                  
                },
                hint: "E-mail",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Adresse"),
              Customizedtextformfield(
                onSaved: (value){
                  _adresse = value;  
                },
                hint: "Adresse",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Locataire ou Propriétaire"),
                DropDownMenuForm(
                  selectedValue: _selectedValueForproprietaireoulocataire,
                  items: const['option1','option2','option3'],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForproprietaireoulocataire = newValue;
                      });
                    },
                      
                    
                    )
                 ,
              const FormLabels(labelForm: "Valeur immeuble(Propriétaire)"),
              Numberfields(
                 onSaved: (value){
                  _Valeurimmeuble=value;
                },
                hint: "Indiquer valeur immeuble",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Valeur Contenu"),
              Numberfields(
                 onSaved: (value){
                  _ValeurContenu=value;
                },
                hint: "Indiquer valeur contenu",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Valeur Dégâts des Eaux"),
              Numberfields(
                 onSaved: (value){
                  _ValeurDegatsdesEaux=value;
                },
                hint: "Indiquer Valeur Dégâts des Eaux",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Valeur Bris de Glaces"),
              Numberfields(
                 onSaved: (value){
                  _ValeurBrisdeGlaces=value;
                },
                hint: "Indiquer Valeur Bris de Glaces",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Valeur Vol"),  
              Numberfields(
                 onSaved: (value){
                  _valeurvol=value;
                },
                hint: "Indiquer valeur vol",
                myfunction: myvalidation),
                SizedBox(
                      width: double.infinity,
                      //padding:const EdgeInsets.only(left: 5.0),
                      //margin: const EdgeInsets.only(left: 5.0),
                      child: ElevatedButton(onPressed: (){
                        // ignore: avoid_print
                        if(_formKey.currentState!.validate()){
                         _formKey.currentState!.save();
                         _sendtheform();
              
                        }
              
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
          )),
      
      ),
    );

  }
}   