import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/date_picker_for_the_form.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';

class AssuranceAgricole extends StatefulWidget {
  const AssuranceAgricole({super.key});

  @override
  State<AssuranceAgricole> createState() => _AssuranceAgricoleState();
}

class _AssuranceAgricoleState extends State<AssuranceAgricole> {
  
  final _formKey = GlobalKey<FormState>();
  String? _Nomdelagriculteur;
  String? _Adresse ;
  String? _Email ;
  String? _Nomdelexploitation ;
  String? _Typedeculture ;
  //for the numbers
  String? _SIRET_SIREN;
  String? _telephone;
  String? _WhatsApp;
  String? _Superficie;
  String? _Valeurdelequipementagricole;
  String? _Valeurdubatimentagricole;
  String? _Dureedelacouverture;



  String? _selectedValueForTypeExploitation; 
  String? _selectedValueForTypeCoverture;
  DateTime? _selectedDate;
  final TextEditingController _dateController= TextEditingController();
  
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
      appBar:const AppBarwidget(isHome: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child:   Container(
            color: Colors.white,
            child: Column(
                    
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              const Text("Informations personnelles:"),
              const SizedBox(height: 25.0,),
              const FormLabels(labelForm: "Nom de l'agriculteur"),
              Customizedtextformfield(
                onSaved: (value){
                  _Nomdelagriculteur = value;
                },
                hint: "Nom & Prénom",
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
                hint: "Adresse",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "Téléphone"),
                 Numberfields(
                onSaved: (value){
                  _telephone=value;
                },  
                hint: "Numéro de téléphone ",
                myfunction: myvalidation),
                 const FormLabels(labelForm: "WhatsApp"),
                 Numberfields(
                 onSaved: (value){
                  _WhatsApp=value;
                }, 
                hint: "Numéro de Whatsup",
                myfunction: myvalidation),
                 const FormLabels(labelForm: "E-mail"),
                 Customizedtextformfield(
                onSaved: (value){
                  _Email = value;
                },  
                hint: "E-mail",
                myfunction: myvalidation
                ),
                  
                 const SizedBox(height: 25.0),
                 const Text("Informations sur l'exploitation:"),
                 const SizedBox(height: 25.0,), 
                 const FormLabels(labelForm: "Nom de l'exploitation"),
                 Customizedtextformfield(
                  onSaved: (value){
                  _Nomdelexploitation = value;
                },
                hint: "Nom de l'exploitation",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "Type d'exploitation"),
                 DropDownMenuForm(
                  selectedValue: _selectedValueForTypeExploitation,
                  items: const['option1','option2','option3'],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForTypeExploitation = newValue;
                      });
                    },
                      
                    
                    )
                 ,
                  
                const FormLabels(labelForm: "Superficie "),
                Numberfields(
                  onSaved: (value){
                  _Superficie=value;
                },
                hint: "Superficie en hectares",
                myfunction: myvalidation),
                  
                const FormLabels(labelForm: "Type de culture"),
                Customizedtextformfield(
                  onSaved: (value){
                  _Typedeculture = value;
                },
                hint: "Type de culture",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "Valeur de l'équipement agricole"),
                 Numberfields(
                  onSaved: (value){
                  _Valeurdelequipementagricole=value;
                },
                hint: "Valeur de l'équipement agricole",
                myfunction: myvalidation),
                 const FormLabels(labelForm: "Valeur du bâtiment agricole"),
                 Numberfields(
                 onSaved: (value){
                  _Valeurdubatimentagricole=value;
                }, 
                hint: "Valeur du bâtiment agricole",
                myfunction: myvalidation),
                 const SizedBox(height: 25.0),
                 const Text("Informations sur la couverture:"),
                 const SizedBox(height: 25.0,), 
                 const FormLabels(labelForm: "Type de couverture"),
                  DropDownMenuForm(
                   selectedValue: _selectedValueForTypeCoverture,
                  items: const["option1","option2","option3"],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForTypeCoverture = newValue;
                      });
                    },
                   
                    
                    ),
                  
                 const FormLabels(labelForm: "Date de début de la couverture"),
                 DatePickerForTheForm(
                  selectedDate: _selectedDate,
                  dateController: _dateController,
                  onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDate=pickedDate;
                      _dateController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }),
                  
                 const FormLabels(labelForm: "Durée de la couverture "),
                 Numberfields(
                 onSaved: (value){
                  _Dureedelacouverture=value;
                }, 
                hint: "Durée de la couverture en années",
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
          ),),
      ),
    );
  }
}    