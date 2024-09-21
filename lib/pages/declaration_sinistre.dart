import 'package:flutter/material.dart';

class DeclarationSinistre extends StatefulWidget {
  const DeclarationSinistre({super.key});

  @override
  State<DeclarationSinistre> createState() => _DeclarationSinistreState();
}

class _DeclarationSinistreState extends State<DeclarationSinistre> {
  
  final _formKey= GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Form(
        key: _formKey,
        child:const Column(
        children: [
         Text("déclaration sinistre"), 
         SizedBox(height:20.0),
         




        ],
      )),
    );
  }
}  