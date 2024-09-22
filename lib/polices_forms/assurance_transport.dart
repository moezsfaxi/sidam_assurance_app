import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/date_picker_for_the_form.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';
import 'package:sidam_assurance_app/form_components/numberfields.dart';
import 'package:dio/dio.dart';
import 'package:sidam_assurance_app/network_controllers/assurance_tronsport_controller.dart';
import 'package:sidam_assurance_app/polices_forms/form_sent_success.dart';

class AssuranceTransport extends StatefulWidget {
  const AssuranceTransport({super.key});

  @override
  State<AssuranceTransport> createState() => _AssuranceTransportState();
}

class _AssuranceTransportState extends State<AssuranceTransport> {
  
  final _formKey= GlobalKey<FormState>();
  String? _Nomdelentreprisedetransport;
  String? _email;
  String? _adress;
  String? _Naturedesmarchandises;
  String? _Modedetransport;
  String? _Dureeestimeedutransport;
  String? _Typedetransport;
  String? _telephone;
  String? _whatsapp;
  String? _SIRET_SIREN;
  DateTime? _selectedDebutDeTransoprt ;

  final TextEditingController _debutController= TextEditingController();
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
      Response response = await send_assurance_transport(
        nom_entreprise_transp: _Nomdelentreprisedetransport,
        type_transport: _Typedetransport,
        adresse: _adress,
        email: _email,
        SIRET_SIREN: _SIRET_SIREN,
        nature_marchandises: _Naturedesmarchandises,
        tel: _telephone,
        wtsp: _whatsapp,
        mode_transport: _Modedetransport,
        duree_estimee_transp: _Dureeestimeedutransport,
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
            key: _formKey
            ,child:  Container(
              color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                
              children: [
                 const SizedBox(height: 25.0,),
                 const FormLabels(labelForm: "Nom de l'entreprise de transport") ,
                 Customizedtextformfield(
                 onSaved: (value){
                  _Nomdelentreprisedetransport = value;
                  }, 
                hint: "Nom de l'entreprise de transport",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "E-mail") ,
                 Customizedtextformfield(
                onSaved: (value){
                  _email = value;
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
                 const FormLabels(labelForm: "Adresse") ,
                 Customizedtextformfield(
                onSaved: (value){
                  _adress = value;
                  }, 
                hint: "Adresse",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "WhatsApp") ,
                 Numberfields(
                   onSaved: (value){
                  _whatsapp=value;
                },
                hint: "Numéro de WhatsApp",
                myfunction: myvalidation),
                 const FormLabels(labelForm: "Nature des marchandises") ,
                 Customizedtextformfield(
                  onSaved: (value){
                  _Naturedesmarchandises = value;
                  },
                hint: "Nature des marchandises",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "Mode de transport") ,
                 Customizedtextformfield(
                  onSaved: (value){
                  _Modedetransport = value;
                  },
                hint: "Mode de transport",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "Date de début du transport") ,
                 DatePickerForTheForm(
                  selectedDate: _selectedDebutDeTransoprt,
                  dateController: _debutController,
                  onDateSelected: (DateTime? pickedDate){
                    setState(() {
                      _selectedDebutDeTransoprt=pickedDate;
                      _debutController.text= "${pickedDate!.toLocal()}".split(" ")[0];
                    });    
                  }), 
                 const FormLabels(labelForm: "Durée estimée du transport") ,
                 Customizedtextformfield(
                 onSaved: (value){
                  _Dureeestimeedutransport = value;
                  }, 
                hint: "Durée estimée du transport",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "Type de transport") ,
                 Customizedtextformfield(
                onSaved: (value){
                  _Typedetransport = value;
                  },  
                hint: "Type de transport(routier,maritime,aérien,,etc)",
                myfunction: myvalidation
                ),
                 const FormLabels(labelForm: "SIRET/SIREN") ,
                 Numberfields(
                   onSaved: (value){
                  _SIRET_SIREN=value;
                },
                hint: "SIRET/SIREN",
                myfunction: myvalidation),
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