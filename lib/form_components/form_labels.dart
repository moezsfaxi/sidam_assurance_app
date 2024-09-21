import 'package:flutter/material.dart';

class FormLabels extends StatelessWidget {
  const FormLabels({required this.labelForm,  super.key});
  final String labelForm;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.all(8.0),
      child: Text(labelForm,
      style:  TextStyle(color: Colors.blue,
      fontFamily: "Roboto-Bold",
      fontSize: MediaQuery.of(context).size.width/20
      ),
      ),
    );
  
  
  
  }
}   