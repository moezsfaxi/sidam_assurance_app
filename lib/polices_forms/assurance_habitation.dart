import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';

class AssuranceHabitation extends StatefulWidget {
  const AssuranceHabitation({super.key});

  @override
  State<AssuranceHabitation> createState() => _AssuranceHabitationState();
}

class _AssuranceHabitationState extends State<AssuranceHabitation> {
  
  final _formKey= GlobalKey<FormState>();
  String? _email ;
  String? _adresse ;
  //for numbers
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
      
               } else if(value != "admin"){
                return "wrong name";
               }
               return null;
            }
  
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