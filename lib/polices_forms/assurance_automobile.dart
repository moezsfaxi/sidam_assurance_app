import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/date_picker_for_the_form.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';

class AssuranceAutomobile extends StatefulWidget {
  const AssuranceAutomobile({super.key});

  @override
  State<AssuranceAutomobile> createState() => _AssuranceAutomobileState();
}

class _AssuranceAutomobileState extends State<AssuranceAutomobile> {
  final _formKey = GlobalKey<FormState>();
  String? _Email;
  String? _Adresse;
  String? _Marque;
  String? _Modele;
  // for the numbers
  String? _telephone;
  String? _WhatsApp;
  String? _Immatriculation;
  String? _Valeuraneuf;
  String? _Valeurvenale;
  


  

  String? _selectedVlaueForTypedeClient;
  String? _selectedVlaueForTypedevehicule;
  String? _selectedVlaueForTypedeCarburant;
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
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
            const Text("Informations personnelles:"),
            const SizedBox(height: 25.0,), 
            const FormLabels(labelForm: "Type de client"),
            DropDownMenuForm(
              selectedValue: _selectedVlaueForTypedeClient,
              items:const ['option1' , 'option2'],
              onChanged: (dynamic newValue){
                setState(() {
                  _selectedVlaueForTypedeClient = newValue;
                });
              }),
                  
            const FormLabels(labelForm: "E-mail"),
            Customizedtextformfield(
              onSaved: (value){
                _Email = value;
              },
              hint: "E-mail",
              myfunction: myvalidation),
            const FormLabels(labelForm: "Téléphone"),
            Numberfields(
              onSaved: (value){
                _telephone=value;
              },
              hint: "Numéro de téléphone",
              myfunction: myvalidation)  ,
            const FormLabels(labelForm: "WhatsApp"),
            Numberfields(
              onSaved: (value){
                _WhatsApp = value;
              },
              hint: "Numéro WhatsApp",
              myfunction: myvalidation)  ,
            const FormLabels(labelForm: "Adresse "),
            Customizedtextformfield(
              onSaved: (value){
                _Adresse = value;
              },
              hint: "Adresse",
              myfunction: myvalidation),
            const SizedBox(height: 25.0,),
            const Text("Informations sur la véhicule:"),
            const SizedBox(height: 25.0,),
            const FormLabels(labelForm: "Type de véhicule"),
            DropDownMenuForm(
              selectedValue: _selectedVlaueForTypedevehicule,
              items:const ['option1' , 'option2'],
              onChanged: (dynamic newValue){
                setState(() {
                  _selectedVlaueForTypedevehicule = newValue;
                });
              }),
            const FormLabels(labelForm: "Marque"),
            Customizedtextformfield(
            onSaved: (value){
                _Marque = value;
              },
            hint: "Marque",
            myfunction: myvalidation),
            const FormLabels(labelForm: "Modèle"),
            Customizedtextformfield(
              onSaved: (value){
                _Marque = value;
              },
              hint: "Modèle de véhicule",
              myfunction: myvalidation),
            const FormLabels(labelForm: "Type de carburant"),
            DropDownMenuForm(
              selectedValue: _selectedVlaueForTypedeCarburant,
              items:const ['option1' , 'option2'],
              onChanged: (dynamic newValue){
                setState(() {
                  _selectedVlaueForTypedeCarburant = newValue;
                });
              }),
            const FormLabels(labelForm: "Immatriculation"),
            Numberfields(
              onSaved: (value){
                _Immatriculation=value;
              },
              hint: "Numéro d'Immatriculation ",
              myfunction: myvalidation)  ,
            const FormLabels(labelForm: "Date de première mise en circulation"),
            DatePickerForTheForm(
            selectedDate: _selectedDate,
            dateController: _dateController,
            onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDate=pickedDate;
                      _dateController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }),
            const FormLabels(labelForm: "Valeur à neuf"),
            Numberfields(
              onSaved: (value){
                _Valeuraneuf=value;
              },
              hint: "Indiquer valeur à neuf", 
              myfunction: myvalidation)  ,
            const FormLabels(labelForm: "Valeur vénale"),
            Numberfields(
              onSaved: (value){
                _Valeurvenale=value;
              },
              hint: "Indiquer valeur vénale", 
              myfunction: myvalidation)  ,
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