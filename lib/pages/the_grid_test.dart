import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/features/cardstest.dart';
//import 'package:sidam_assurance_app/testingforms/cardstest.dart';

class TheGridTest extends StatelessWidget {
  const  TheGridTest ({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarwidget(isHome: false),
      body: GridView.count(crossAxisCount: 2,
      
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 20.0,
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top:MediaQuery.of(context).size.height/14,
         
          ),
          childAspectRatio: 0.9,
        
        
        
        
        
        children:const [
         
          CardsTest(imageforthehome: "assets/images/contrat.png",titleforthehome: "votre polices"),
          CardsTest(imageforthehome: "assets/images/history.png",titleforthehome: "histoire"),
          CardsTest(imageforthehome: "assets/images/account.png",titleforthehome: "compte"),
          CardsTest(imageforthehome: "assets/images/createtwo.png",titleforthehome: "demander "),
          CardsTest(imageforthehome: "assets/images/complaints.png",titleforthehome: "réclamations"),
          CardsTest(imageforthehome: "assets/images/sinister.png",titleforthehome: "déclaration sinistre"),
      
          
           
           ],
        
        
        ),
    );
  }
}