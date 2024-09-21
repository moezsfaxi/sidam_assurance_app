import 'package:flutter/material.dart';

class FormLabelsLogin extends StatelessWidget {
  const FormLabelsLogin({required this.labelForm,  super.key});
  final String labelForm;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(8.0),
      child: Text(labelForm,
      style:  TextStyle(color: Colors.white,
      fontFamily: "Roboto-Bold",
      fontSize: MediaQuery.of(context).size.width/20
      ),
      ),
    );
  
  
  
  }
}   