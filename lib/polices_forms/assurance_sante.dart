import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/date_picker_for_the_form.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';
import 'package:sidam_assurance_app/network_controllers/assurance_sante_controller.dart';

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
  
  //for the numbers
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
                        // ignore: avoid_print
                         _formKey.currentState!.save();

                       setState(() {
                         submitForm(
                         adresse: _adresse??"a",
                         email: _email??"a",
                         nomPrenom: _NomPrenom??"a",
                         whatsapp: _whatsapp??"a",
                         nomDuBeneficiaire: _Nomdubeneficiaire??"a",
                         telephone: _telephone??"a",
                         numeroDeSecuriteSociale: _Numerodesecuritesociale??"a",
                         selectedValueForTypedeClient: _selectedValueForTypedeClient??"a",
                         selectedValueForTypedecouverture: _selectedValueForTypedecouverture??"a",
                         selectedDate: _selectedDate


                         );
                       });
              
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
          )) ,
      
      ),
    );
  }
}     