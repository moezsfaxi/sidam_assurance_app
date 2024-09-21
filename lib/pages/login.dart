// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
//import 'package:sidam_assurance_app/pages/options.dart';
import 'package:sidam_assurance_app/pages/the_grid_test.dart';

class LoginInWidgetform extends StatefulWidget {
  const LoginInWidgetform({super.key});

  @override
  State<LoginInWidgetform> createState() => _LoginInWidgetformState();
}

class _LoginInWidgetformState extends State<LoginInWidgetform> {

  final _formKey = GlobalKey<FormState>();
  String? _user_name;
  String? _password; 


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Form(
        key: _formKey,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           TextFormField(
            onSaved: (value){
              _user_name = value;
              

            },
            decoration: const InputDecoration(
             icon:  Icon(Icons.person),
             hintText: "Enter your name",
             labelText: "Nom d'utulisteur" 
            ),
            validator: (value){
               if(value!.isEmpty){
                return "please enter some text";
      
               } else if(value != "admin"){
                return "wrong name";
      
               }
               return null;
            },
           ) ,
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.lock),
                labelText: "mot de passe "
      
              ),
              obscureText: true,
              onSaved: (value){
                _password= value;
              },
              validator: (value){
                  if(value!.isEmpty){
                return "please enter some text";
      
               } else if(value !="admin"){
                return "wrong password";
      
               }
               return null;   
              },
            )
           
           ,
         
          
             SizedBox(
              //padding:const EdgeInsets.only(left:10.0,right: 10.0),
              width: double.infinity,
              
              child: ElevatedButton(
                onPressed: (){
                   if(_formKey.currentState!.validate()){
                     
                      _formKey.currentState!.save();
                      print(_user_name);
                      print(_password);



                      Navigator.push(
                        context,
                         MaterialPageRoute(builder: (contex)=> const TheGridTest()   ));
                   } 
                }
                ,
                style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  splashFactory:  InkRipple.splashFactory )
                ,
                child: const  Text("connexion")
                ),
             )
      
      
          ],
      
      
      
        ),
      
      
      
      ),
    );
  }
}