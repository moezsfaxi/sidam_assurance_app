import 'package:flutter/material.dart';

class DescriptionsTextForm extends StatelessWidget {
  const DescriptionsTextForm(
    {required this.hint,
    required this.myfunction,
    required this.onSaved ,
    super.key});

  final String hint;
  final String? Function(String?) myfunction;
  final Function(String) onSaved;
  


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
         //decoration:InputDecoration(
         // hintText: hint,
         //),
         maxLines: 3,
        decoration: InputDecoration(
        enabledBorder:const OutlineInputBorder(
        borderSide:BorderSide(color: Color.fromARGB(255, 32, 55, 185), width: 2.0)),
        border: const OutlineInputBorder(borderSide: BorderSide()),
        fillColor: Colors.white,
        filled: true,
        
        
        hintText: hint ,
      
        ),
        onSaved: (value){
          if(value!=null){
            onSaved(value);
          }
      
        },
      
         
         validator:myfunction , 
      
      
      ),
    )  ;
  }
}