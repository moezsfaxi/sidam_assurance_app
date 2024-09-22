import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/descriptions_text_form.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';
import 'package:dio/dio.dart';
import 'package:sidam_assurance_app/network_controllers/assurance_professionnelle_controller.dart';
import 'package:sidam_assurance_app/polices_forms/form_sent_success.dart';

class AssuranceProfessionnelle extends StatefulWidget {
  const AssuranceProfessionnelle({super.key});

  @override
  State<AssuranceProfessionnelle> createState() => _AssuranceProfessionnelleState();
}

class _AssuranceProfessionnelleState extends State<AssuranceProfessionnelle> {

  final _formKey = GlobalKey<FormState>();
  String? _Nomdelentreprise;
  String? _Typedactivite;
  String? _Adresse;
  String? _email;
  String? _Nomduresponsable;
  String? _SIRET_SIREN;
  String? _telephone;
  String? _whatsapp;
  String? _Nombredemployes;
  String? _Chiffredaffairesannuel;
  String? _Valeurdesbiensassures;
  String? _Descriptiondeslocaux;
  	
  

  String? _selectedValueForTypedeCouverture;
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
      Response response = await send_assurance_professionnelle(
        nom_entreprise: _Nomdelentreprise,
        type_activite: _Typedactivite,
        adresse: _Adresse,
        email: _email,
        nom_resp: _Nomduresponsable,
        SIRET_SIREN: _SIRET_SIREN,
        tel: _telephone,
        wtsp: _whatsapp,
        nbr_emp: _Nombredemployes,
        chiffre_aff_annuel: _Chiffredaffairesannuel,
        valeur_biens_assures: _Valeurdesbiensassures,
        description_locaux: _Descriptiondeslocaux,
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
    return  Scaffold(
      appBar: const AppBarwidget(isHome: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FormLabels(labelForm: "Nom de l'entreprise"),
              Customizedtextformfield(
                onSaved: (value){
                  _Nomdelentreprise = value;
                },
                hint: "Nom de l'entreprise",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Type d'activité"),
              Customizedtextformfield(
                onSaved: (value){
                  _Typedactivite = value;
                },
                hint: "Type d'activité",
                myfunction: myvalidation
                ),  
              const FormLabels(labelForm: "SIRET/SIREN"), 
              Numberfields(
                onSaved: (value){
                  _SIRET_SIREN=value;
                },
                hint: "SIRET/SIREN",
                myfunction: myvalidation), 
              const FormLabels(labelForm: "Adresse"),
              Customizedtextformfield(
                onSaved: (value){
                  _Adresse = value;
                },
                hint: "",
                myfunction: myvalidation
                ),  
              const FormLabels(labelForm: "Téléphone"),  
              Numberfields(
                onSaved: (value){
                  _telephone=value;
                },
                hint: "Numéro de Téléphone ",
                myfunction: myvalidation),
              const FormLabels(labelForm: "WhatsApp"),
              Numberfields(
                onSaved: (value){
                  _whatsapp=value;
                },
                hint: "Numéro WhatsApp ",
                myfunction: myvalidation),  
              const FormLabels(labelForm: "E-mail"), 
              Customizedtextformfield(
                onSaved: (value){
                  _email = value;
                },
                hint: "E-mail",
                myfunction: myvalidation
                ), 
              const FormLabels(labelForm: "Nom du responsable"),
              Customizedtextformfield(
                onSaved: (value){
                  _Nomduresponsable = value;
                },
                hint: "Nom du responsable",
                myfunction: myvalidation
                ),  
              const FormLabels(labelForm: "Nombre d'employés"),  
              Numberfields(
                onSaved: (value){
                  _Nombredemployes=value;
                },
                hint: "Nombre d'employés",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Chiffre d'affaires annuel"),  
              Numberfields(
                onSaved: (value){
                  _Chiffredaffairesannuel=value;
                },
                hint: "Chiffre d'affaires annuel",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Description des locaux"), 
              DescriptionsTextForm(
                onSaved: (value){
                  _Descriptiondeslocaux=value;
                },
                hint: "Description des locaux",
                myfunction: myvalidation) , 
              const FormLabels(labelForm: "Valeur des biens assurés"),  
              Numberfields(
                onSaved: (value){
                  _Valeurdesbiensassures=value;
                },
                hint: "Valeur des biens assurés",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Type de couverture"),  
              DropDownMenuForm(
                  selectedValue: _selectedValueForTypedeCouverture,
                  items: const['option1','option2','option3'],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForTypedeCouverture = newValue;
                      });
                    },
                      
                    
                    )
                 ,
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
