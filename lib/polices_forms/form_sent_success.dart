import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/pages/the_grid_test.dart';

class FormSentSuccess extends StatefulWidget {
  const FormSentSuccess({super.key});

  @override
  State<FormSentSuccess> createState() => _FormSentSuccessState();
}
class _FormSentSuccessState extends State<FormSentSuccess> {
 
 @override
  void initState() {
    
    super.initState();
    Future.delayed(const Duration(seconds:2 ),(){

       Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const TheGridTest()),
              (Route<dynamic> route) => false,
            ); 


    });



  }
 
 
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  AppBarwidget(isHome: true),
      body: Center(child: Text("la demande a été crée"),),


    );
  }
}