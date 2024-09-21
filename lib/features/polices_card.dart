import 'package:flutter/material.dart';

class PolicesCard extends StatelessWidget {
  const PolicesCard({super.key});

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
              const Row(
              children: [
                Icon(Icons.book, color: Colors.blue),
                 Text("Assurance Professionnelle",
                 style: TextStyle(color: Colors.blue ,
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
                       const Text("3000EUR",style: TextStyle(color: Colors.blue,
                 fontFamily: "Roboto-Bolod")),   

                      ],
                    ),
                      SizedBox(height:MediaQuery.of(context).size.width*0.02 ,),
                    Row(
                      children: [
                       const Text("échiance:",style: TextStyle(color: Colors.black,
                 fontFamily: "Roboto-Bolod")), 
                       SizedBox(width: MediaQuery.of(context).size.width*0.02),
                       const Text("250EUR",style: TextStyle(color: Colors.blue,
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
                        // ignore: avoid_print
                        print("renouveler");
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