import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_agricole.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_automobile.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_chantiers.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_habitation.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_individuelle.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_professionnelle.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_sante.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_transport.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_voyage.dart';

class CreationCards extends StatelessWidget {
  const CreationCards({required this.assurance,required this.Desc, super.key});
  final String assurance;
  final String Desc;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.only(left: 15.0,right: 15.0,top: 20.0),
      decoration:  const BoxDecoration(
       // color: Color.fromRGBO(20, 197, 59, 1),
       color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10.0))

       

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.book,color: Colors.white,),        
           Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:  Text(assurance,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width/30
              
            ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(left: 20.0),
            
            child:  Text(Desc,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width/50
              
            ),
            ),
          ),
          const SizedBox(height: 10.0),

          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width*0.4,
              child: ElevatedButton(
                onPressed: (){
                 if(assurance == "Assurance Agricole"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceAgricole()),);
                
                 } else if(assurance == "Assurance Automobile"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceAutomobile()),);
                 } else if(assurance == "Assurance Chantiers"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceChantier()),);
                 }  else if(assurance == "Assurance Habitation"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceHabitation()),);
                 }  else if(assurance == "Assurance Individuelle"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceIndividuelle()),);
                 }  else if(assurance == "Assurance Santé"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceSante()),);
                 }  else if(assurance == "Assurance Transport"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceTransport()),);
                 }  else if(assurance == "Assurance Professionnelle"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceProfessionnelle()),);
                 }  else if(assurance == "Assurance Voyage"){
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssuranceVoyage()),);
                 } 







                }, 
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor:const Color.fromRGBO(20, 197, 59, 1)
              
                ),
                child:const Text("crée"),),
            ),

          )
        ],
      ),
    ) ;
  }
}      