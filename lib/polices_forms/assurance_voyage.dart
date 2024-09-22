import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/date_picker_for_the_form.dart';
import 'package:sidam_assurance_app/form_components/descriptions_text_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';
import 'package:dio/dio.dart';
import 'package:sidam_assurance_app/network_controllers/assurance_voyage_controller.dart';
import 'package:sidam_assurance_app/polices_forms/form_sent_success.dart';

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
  String? _telephone;
  String? _whatsapp;
  String? _Dureeduvoyage;
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
      Response response = await send_assurance_voyage(
        nom_voyageur: _Nomduvoyageur,
        email: _email,
        adresse: _adresse,
        num_pass: _Numerodepasseport,
        destination: _Destinationduvoyage,
        motif_voyage: _Motifduvoyage,
        tel: _telephone,
        wtsp: _whatsapp,
        duree_voyage: _Dureeduvoyage,
        condition_medical: _Conditionsmedicales,
        date_depart: _selectedDateforDepart,
        date_retour: _selectedDateforretour,
        date_naissance: _selectedDateforbd,
        created_at: DateTime.now().toIso8601String(),
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
                        _formKey.currentState!.save();
                        _sendtheform();
                      }
              
                    },
                     child:_isLoading ? const CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3.0,
                              value: 0.7,) 
                              : const Text("evoyé la demane",
                              style: TextStyle(fontFamily: "Roboto-Medium"),
                              ) ),
                  )
             
                  
                  
                  
            ],
                    ),
          )),
      
      
      ),
    );
  }
}      