import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/form_components/customizedtextformfield.dart';
import 'package:sidam_assurance_app/form_components/form_labels.dart';

class Formdeco extends StatefulWidget {
  const Formdeco({super.key});

  @override
  State<Formdeco> createState() => _FormdecoState();
}

class _FormdecoState extends State<Formdeco> {
  final _formKey = GlobalKey<FormState>();
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
    return  SingleChildScrollView(
      child: Form(
        key: _formKey,
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          const FormLabels(labelForm: "Title"),
          Customizedtextformfield(hint:"title" ,myfunction: myvalidation,onSaved: (value){},),


         ],   


        )
        ),
    );
  }
}