import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/changevalue/changedate.dart';

class PolicesCard extends StatelessWidget {
  final String type_assurance ;
  final String montant_total ;
  final String paiement ;
  final int id;
   final String date_debut_couvert;
  final String date_fin_couvert;
  const PolicesCard({super.key,
                     required this.id, 
                     required this.date_debut_couvert,
                     required this.date_fin_couvert, 
                    required this.type_assurance,
                    required this.montant_total,
                    required this.paiement});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
      return  Container(
          decoration:  BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.blue,
              width: 1.5,
              style: BorderStyle.solid
              

            )
          ),
          child:  Column(
            children: [
               Row(
              children: [
                const Icon(Icons.book, color: Colors.blue),
                 Text(type_assurance.toUpperCase(),
                 style:const TextStyle(color: Colors.blue ,
                 fontFamily: "Roboto-Bolod"
                 ),
                 
                 )
              ],),
              SizedBox(height:MediaQuery.of(context).size.width*0.02 ,),
              Padding(padding: EdgeInsets.only(
                left:MediaQuery.of(context).size.width*0.09),
                child: Column(
                  children: [
                    Row(
                      children: [
                       const Text("Montant:",style: TextStyle(color: Colors.black,
                 fontFamily: "Roboto-Bolod")), 
                       SizedBox(width: MediaQuery.of(context).size.width*0.02),
                        Text(montant_total.toUpperCase(),style: const TextStyle(color: Colors.blue,
                 fontFamily: "Roboto-Bolod")),   

                      ],
                    ),
                      SizedBox(height:MediaQuery.of(context).size.width*0.02 ,),
                    Row(
                      children: [
                       const Text("échiance:",style: TextStyle(color: Colors.black,
                 fontFamily: "Roboto-Bolod")), 
                       SizedBox(width: MediaQuery.of(context).size.width*0.02),
                        Text(paiement.toUpperCase(),style:const TextStyle(color: Colors.blue,
                 fontFamily: "Roboto-Bolod")),   

                      ],
                    ),                   
                  
                    SizedBox(height: MediaQuery.of(context).size.width*0.05)
                    
                  ],
                ),
                
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Align(
                    alignment: Alignment.bottomCenter,
                    child:ElevatedButton(
                      style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor:const Color.fromRGBO(20, 197, 59, 1)
                                 
                                   ),
                      onPressed: (){
                      Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> Changedate(theid: id, typeofanssurance: type_assurance)));
                    },
                     child: const Text("Rrenouveler",style: TextStyle(color: Colors.white,
                 fontFamily: "Roboto-Bolod")),) ,
                                   ),
                 )
            ],
          ),
      );
    });
  }
}