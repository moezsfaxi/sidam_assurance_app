import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/pages/login.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white
      ,
      margin:const EdgeInsets.only(left:15.0,right: 15.0,top:25.0 ,bottom: 50.0)
      ,
      child:const Column(
      children: [
       SizedBox(
        height: 15.0,
       ), 
       Image(image: AssetImage("assets/images/sidam.png")),
       
       
      LoginInWidgetform()
      ],)


    );
  }
}  