import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/date_picker_for_the_form.dart';
import 'package:sidam_assurance_app/form_components/descriptions_text_form.dart';
import 'package:sidam_assurance_app/form_components/drop_down_menu_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';

class AssuranceChantier extends StatefulWidget {
  const AssuranceChantier({super.key});

  @override
  State<AssuranceChantier> createState() => _AssuranceChantierState();
}

class _AssuranceChantierState extends State<AssuranceChantier> {

  final _formKey = GlobalKey<FormState>();
  String? _Nomduprojet; 
  String? _Typedechantier; 
  String? _Numerodepermisdeconstruire; 
  String? _Adresseduchantier; 
  String? _Telephoneduresponsable; 
  String? _Emailduresponsable; 
  String? _Nomdelentrepreneur; 
  //for the numbers
  String? _telephoneduresponsable ;
  String? _Valeurtotaleduprojet ;
  String? _Valeurdesequipements ;
  //for desc
  String? _Descriptiondestravaux;


  

  DateTime? _selectedDatefordebut;
  DateTime? _selectedDateforfin;
  String? _selectedValueForTypeCoverture;
  final TextEditingController _debutController= TextEditingController();
  final TextEditingController _finController = TextEditingController();
  

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

    return   Scaffold(
      appBar: const AppBarwidget(isHome: true),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              const FormLabels(labelForm: "Nom du projet"),
              Customizedtextformfield(
                onSaved: (value){
                  _Nomduprojet = value;
                },
                hint: "Nom du projet",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Type de chantier"),
              Customizedtextformfield(
                 onSaved: (value){
                  _Typedechantier = value;
                },
                hint: "Type de chantier",
                myfunction: myvalidation
                ),
                  
              const FormLabels(labelForm: "Numéro de permis de construire"),
              Customizedtextformfield(
                 onSaved: (value){
                  _Numerodepermisdeconstruire = value;
                },
                hint: "Numéro de permis de construire",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Adresse du chantier"),
              Customizedtextformfield(
                 onSaved: (value){
                  _Adresseduchantier = value;
                },
                hint: "Adresse du chantier",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Téléphone du responsable"),
              Numberfields(
                onSaved: (value){
                  _telephoneduresponsable=value;
                },
                hint: "Numéro de téléphone",
                myfunction: myvalidation),
              const FormLabels(labelForm: "E-mail du responsable"),
              Customizedtextformfield(
                 onSaved: (value){
                  _Emailduresponsable = value;
                },
                hint: "E-mail du responsable",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Nom de l'entrepreneur"),
              Customizedtextformfield(
                 onSaved: (value){
                  _Nomdelentrepreneur = value;
                },
                hint: "Nom de l'entrepreneur",
                myfunction: myvalidation
                ),
              const FormLabels(labelForm: "Valeur totale du projet (en FCFA)"),
              Numberfields(
                onSaved: (value){
                  _Valeurtotaleduprojet=value;
                },
                hint: "Valeur totale du projet (en FCFA)",
                myfunction: myvalidation),
              const FormLabels(labelForm: "Description des travaux"),
              DescriptionsTextForm(
                onSaved: (value){
                  _Descriptiondestravaux=value;
                },
                hint: "Description des travaux",
                 myfunction: myvalidation),
              const FormLabels(labelForm: "Date de début des travaux"),
               DatePickerForTheForm(
                  selectedDate: _selectedDatefordebut,
                  dateController: _debutController,
                  onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDatefordebut=pickedDate;
                      _debutController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }),
              const FormLabels(labelForm: "Date prévue d'achèvement"),
               DatePickerForTheForm(
                  selectedDate: _selectedDateforfin,
                  dateController: _finController,
                  onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDateforfin=pickedDate;
                      _finController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }),
              const FormLabels(labelForm: "Type de couverture"),
              DropDownMenuForm(
                  selectedValue: _selectedValueForTypeCoverture,
                  items: const['option1','option2','option3'],
                  onChanged: (dynamic newValue) {
                      setState(() {
                        _selectedValueForTypeCoverture = newValue;
                      });
                    },
                      
                    
                    )
                 ,
              const FormLabels(labelForm: "Valeur des équipements (en FCFA)"),
              Numberfields(
                onSaved: (value){
                  _Valeurdesequipements=value;
                },
                hint: "Valeur des équipements (en FCFA)",
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
