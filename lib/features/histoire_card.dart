import 'package:flutter/material.dart';

class HistoireCard extends StatelessWidget {
  const HistoireCard({super.key});

  

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.only(left: 15.0,right: 15.0,top: 20.0),
      decoration:  const BoxDecoration(
        color: Color.fromRGBO(20, 197, 59, 1),
        borderRadius: BorderRadius.all(Radius.circular(10.0))

       

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.book,color: Colors.white,),        
           Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child:  Text("assurance professionnelle",
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width/30
              
            ),
            ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Text("Montant :",style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width/35
                
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("3000euro",style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width/35
                  
                )),
              ),
                         ],),
            ) ,
           
           Row(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("échéance:",style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width/35
                
                            )),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("250euro",style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width/35
                
              )),
            ),
           ],)
           ,


          const SizedBox(height: 10.0),

         
        ],
      ),
    ) ;
  }
}      