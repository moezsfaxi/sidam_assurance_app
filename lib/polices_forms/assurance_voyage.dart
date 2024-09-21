import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/date_picker_for_the_form.dart';
import 'package:sidam_assurance_app/form_components/descriptions_text_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';

class AssuranceVoyage extends StatefulWidget {
  const AssuranceVoyage({super.key});

  @override
  State<AssuranceVoyage> createState() => _AssuranceVoyageState();
}

class _AssuranceVoyageState extends State<AssuranceVoyage> {
  
  final _formKey = GlobalKey<FormState>();
  String? _Nomduvoyageur;
  String? _email;
  String? _adresse;
  String? _Numerodepasseport;
  String? _Destinationduvoyage;
  String? _Motifduvoyage;
  //for the numbers
  String? _telephone;
  String? _whatsapp;
  String? _Dureeduvoyage;
  //for desc
  String? _Conditionsmedicales;
 
 


  DateTime? _selectedDateforDepart;
  DateTime? _selectedDateforretour;
  DateTime? _selectedDateforbd;
  final TextEditingController _departController = TextEditingController();
  final TextEditingController _retourController = TextEditingController();
  final TextEditingController _bdController = TextEditingController();

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
          key: _formKey ,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text("Informations personnelles:"),
             const SizedBox(height: 25.0,),
             const FormLabels(labelForm: "Nom du voyageur") ,
             Customizedtextformfield(
              onSaved: (value){
                _Nomduvoyageur=value;  
              },
                hint: "Nom du voyageur",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "E-mail") ,
             Customizedtextformfield(
               onSaved: (value){
                _email=value;  
              },
                hint: "E-mail",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "Téléphone") ,
             Numberfields(
              onSaved: (value){
                  _telephone=value;
                },
                hint: "Numéro de téléphone",
                myfunction: myvalidation),
             const FormLabels(labelForm: "WhatsApp") ,
             Numberfields(
              onSaved: (value){
                  _whatsapp=value;
                },
                hint: "Numéro de Whatsup",
                myfunction: myvalidation),
             const FormLabels(labelForm: "Date de naissance") ,
             DatePickerForTheForm(
                  selectedDate: _selectedDateforbd,
                  dateController: _bdController,
                  onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDateforbd=pickedDate;
                      _bdController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }),
             const FormLabels(labelForm: "Adresse") ,
               Customizedtextformfield(
                 onSaved: (value){
                _adresse=value;  
              },
                hint: "Adresse",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "Numéro de passeport") ,
             Customizedtextformfield(
                 onSaved: (value){
                _Numerodepasseport=value;  
              },
                hint: "Numéro de passeport",
                myfunction: myvalidation
                ),
             const SizedBox(height: 25.0,),
             const Text("Information sur la voyage"),
             const SizedBox(height: 25.0,),
             const FormLabels(labelForm: "Destination ") , 
             Customizedtextformfield(
               onSaved: (value){
                _Destinationduvoyage=value;  
              },
                hint: "Destination du voyage",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "Date de départ") ,
             DatePickerForTheForm(
                  selectedDate: _selectedDateforDepart,
                  dateController: _departController,
                  onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDateforDepart=pickedDate;
                      _departController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }),
             const FormLabels(labelForm: "Date de retour") ,
             DatePickerForTheForm(
                  selectedDate: _selectedDateforretour,
                  dateController: _retourController,
                  onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDateforretour=pickedDate;
                      _retourController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }), 
             const FormLabels(labelForm: "Durée du voyage") ,
             Numberfields(
              onSaved: (value){
                  _Dureeduvoyage=value;
                },
                hint: "Durée du voyage en jours",
                myfunction: myvalidation), 
             const FormLabels(labelForm: "Motif du voyage") , 
             Customizedtextformfield(
               onSaved: (value){
                _Motifduvoyage=value;  
              },
                hint: "Motif du voyage(loisir,affaires,etc..)",
                myfunction: myvalidation
                ),
             const FormLabels(labelForm: "Conditions médicales") ,  
             DescriptionsTextForm(
              onSaved: (value){
                  _Conditionsmedicales=value;
                },
              hint: "Conditions médicales (i.e cas écheant)",
              myfunction: myvalidation) ,
             SizedBox(
                    width: double.infinity,
                    
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                         foregroundColor: Colors.white,
                         backgroundColor: Colors.blue   
                      ),
                      onPressed: (){
                      if(_formKey.currentState!.validate()){
                        // ignore: avoid_print
                        print("submitted");
                      }
              
                    },
                     child:const Text("submit") ),
                  )
             
                  
                  
                  
            ],
                    ),
          )),
      
      
      ),
    );
  }
}      