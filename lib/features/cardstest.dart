import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/les_polices_active.dart';
import 'package:sidam_assurance_app/pages/creation_de_police.dart';
//import 'package:sidam_assurance_app/pages/declaration_sinistre.dart';
//import 'package:sidam_assurance_app/pages/histoire.dart';
import 'package:sidam_assurance_app/pages/histoire_de_paiement.dart';
import 'package:sidam_assurance_app/pages/informations_personnelles.dart';
//import 'package:sidam_assurance_app/pages/polices.dart';
import 'package:sidam_assurance_app/pages/reclamation.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_automobile.dart';

class CardsTest extends StatelessWidget {
  const CardsTest({required this.imageforthehome,required this.titleforthehome  ,super.key});
  final String imageforthehome;
  final String titleforthehome;

  @override
  Widget build(BuildContext context) {
    return  LayoutBuilder(builder: (context,constraintheflow){

        return InkWell(
          onTap:(){
           switch (titleforthehome) {
            case "votre polices" :
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const ActivePolices(useremail: 'test@gmail.com') ));

          
            case "histoire" :
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const HistoireDePaiement() ));

            
            case "compte" :
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const InformationsPersonnelles() )); 

            case "demander" :
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const CreationDePolice() ));

            case "réclamations" :
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const Reclamation() ));

            case "déclaration sinistre" :
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const AssuranceAutomobile() ));      

      


           }








          } ,
          child: Card(
            elevation: 20.0,
            shadowColor: Colors.black,
            surfaceTintColor: Colors.black,
          
            child: Container(
                  width: MediaQuery.of(context).size.width/3,
                  height: MediaQuery.of(context).size.height/4,
                  
                  
                  
                  //color: const Color.fromRGBO(20, 197, 59, 1),
                  
                  decoration: const BoxDecoration(
                  //color:  Color.fromRGBO(20, 197, 59, 1),
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.0,
                    spreadRadius: 2.0,
                    offset: Offset(0, 3.0),
                    blurStyle: BlurStyle.normal
                    )]
                  ),
                  child: Column(
            children: [
               const SizedBox(height: 5.0), 
               Image(image:  AssetImage(imageforthehome),
               height: constraintheflow.maxHeight*0.5,
               color: Colors.white,
               ),
               const SizedBox(height: 10.0,),
                Text(titleforthehome,
               style: TextStyle(color: Colors.white,
               fontSize: MediaQuery.of(context).size.width/25,
               decoration: TextDecoration.underline,
               fontFamily: 'Roboto-Bold'  
               ))
            ],
                  ),
                ),
          ),
        ); 


    });
  }
}   
