import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/descriptions_text_form.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';

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
  //for the numbers
  String? _SIRET_SIREN;
  String? _telephone;
  String? _whatsapp;
  String? _Nombredemployes;
  String? _Chiffredaffairesannuel;
  String? _Valeurdesbiensassures;
  //for desc
  String? _Descriptiondeslocaux;
  	
  

  String? _selectedValueForTypedeCouverture;
  String? myvalidation(String? value){
               if(value!.isEmpty){
                return "please enter some text";
      
               } else if(value != "admin"){
                return "wrong name";
               }
               return null;
            }

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
                        
                        // ignore: avoid_print
                        print("submitting");
              
                        }
              
                      },
                      style: ElevatedButton.styleFrom(
                         foregroundColor: Colors.white,
                         backgroundColor: Colors.blue       
                      ),
                       child:const Text("submit")
                       ),      
                      )
            ],
                    ),
          )),
      ),
    );
  }
}
