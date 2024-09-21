import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';

class AssuranceIndividuelle extends StatefulWidget {
  const AssuranceIndividuelle({super.key});

  @override
  State<AssuranceIndividuelle> createState() => _AssuranceIndividuelleState();
}

class _AssuranceIndividuelleState extends State<AssuranceIndividuelle> {
  
  final _formKey= GlobalKey<FormState>();
  String? _email;
  String? _fonction;
  //for the numbers
  String? _telephone;
  String? _whatsapp;
  String? _CapitalDeces;
  String? _MontantFraisMedicaux;
  String? _CapitalInvaliditePermanente;
 



  String? _selectedValueForTypedeClient;
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
                  selectedValue: _selectedValueForTypedeClient,
                  items: const['option1','option2','option3'],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForTypedeClient = newValue;
                      });
                    },
                      
                    
                    )
                 ,
              const FormLabels(labelForm: "Téléphone"),
              Numberfields(
                onSaved: (value){
                  _telephone=value;
                },
                hint: "Numéro de téléphone ",
                myfunction: myvalidation),
              const FormLabels(labelForm: "E-mail"),
              Customizedtextformfield(
                onSaved: (value){
                  _email = value;
                },
                hint: "E-mail",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "WhatsApp"),
              Numberfields(
                onSaved: (value){
                  _whatsapp=value;
                },
                hint: "Numéro de WhatsApp",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Fonction"),
               Customizedtextformfield(
                onSaved: (value){
                  _fonction = value;
                },
                hint: "Fonction",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Capital Décès"),
              Numberfields(
                onSaved: (value){
                  _CapitalDeces=value;
                },
                hint: "Montant du Capital Décès",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Montant Frais Médicaux"),
              Numberfields(
                onSaved: (value){
                  _MontantFraisMedicaux=value;
                },
                hint: "Montant Frais Médicaux",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Capital Invalidité Permanente"),
              Numberfields(
                onSaved: (value){
                  _CapitalInvaliditePermanente=value;
                },
                hint: "Montant du capital en cas d'Invalidité Permanente ",
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