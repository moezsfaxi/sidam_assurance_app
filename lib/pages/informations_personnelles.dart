import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';

class InformationsPersonnelles extends StatefulWidget {
  const InformationsPersonnelles({super.key});

  @override
  State<InformationsPersonnelles> createState() => _InformationsPersonnellesState();
}

class _InformationsPersonnellesState extends State<InformationsPersonnelles> {
  
  final _formKey = GlobalKey<FormState>();
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarwidget(isHome: true,)
      ,body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.only(left: 15.0) ,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40.0),
                const Row(
                  children: [
                    Text("Nom:"),
                    SizedBox(width: 35.0),
                    Text("lenom")
                    
                  ],
                ),
                const SizedBox(height: 20.0),
          
                const Row(
                  children: [
                    Text("Prenom:"),
                    SizedBox(width: 20.0),
                    Text("Leprenom")
                    
                  ],),
                  const SizedBox(height: 20.0),
                   Row(
                    children: [
                      const Text("Email:"),
                      const SizedBox(width:30.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: TextFormField(
                          initialValue: "monemail@example.com",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      const Text("Adress:"),
                      const SizedBox(width:25.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: TextFormField(
                          initialValue: "C'est mon adress",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      const Text("Téléphone:"),
                      const SizedBox(width:10.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.5,
                        child: TextFormField(
                          initialValue: "00-0000-000-00",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
          
                  SizedBox(
                  width: double.infinity,
                  //padding:const EdgeInsets.only(left: 5.0),
                  //margin: const EdgeInsets.only(left: 5.0),
                  child: ElevatedButton(onPressed: (){
                    // ignore: avoid_print
                    if(_formKey.currentState!.validate()){
                    
                    // ignore: avoid_print
                    print("submitting");
          
                    }
          
                  },
                  style: ElevatedButton.styleFrom(
                     foregroundColor: Colors.white,
                     backgroundColor: Colors.blue
        
        
                  ),
                   child:const Text("submit")
                   ),      
          
          
                  )
          
          
              ],
          
          
            )
               ),
        ),
      ),
    );
  }
}      