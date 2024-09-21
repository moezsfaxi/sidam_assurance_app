import 'package:flutter/material.dart';

class LoginPassword extends StatelessWidget {
  const LoginPassword({required this.hint,
                                 required this.myfunction,
                                 required this.onSaved,
                                 required this.passwordController,
                                 super.key});

  final String hint;
  final String? Function(String?) myfunction;
  final Function(String) onSaved;
  final TextEditingController passwordController;
  


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.all(8.0),
      child: TextFormField(
         //decoration:InputDecoration(
         // hintText: hint,true
         //),
        obscureText: true,
        decoration: InputDecoration(
        icon:const Icon(Icons.lock,color:Colors.white),  
      
        enabledBorder:const OutlineInputBorder(
        borderSide:BorderSide(color: Colors.black, width: 2.0)),
        border: const OutlineInputBorder(borderSide: BorderSide()),
        fillColor: Colors.white,
        filled: true,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey,
        fontFamily: "Roboto-Thin"  
        )
        
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