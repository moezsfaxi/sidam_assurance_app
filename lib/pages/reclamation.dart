import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';

class Reclamation extends StatefulWidget {
  const Reclamation({super.key});

  @override
  State<Reclamation> createState() => _ReclamationState();
}

class _ReclamationState extends State<Reclamation> {
  
  final _formKey = GlobalKey<FormState>();
  String? _sujet;
  String? _details;
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarwidget(isHome: true),
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.only(left: 10.0) ,
          child: Form(
            key: _formKey
            ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Row(
                children: [
                  const Text("sujet:"),
                  //const SizedBox(width: 15.0,),
                  SizedBox(
                  width: (MediaQuery.of(context).size.width*0.6),
                  child: TextFormField(
                    onSaved: (value){
                      _sujet= value;

                    },
                    decoration:const InputDecoration(
                      hintText: "sujet"
          
                    ),
          
                  ),  
          
                  )
          
                ],
          
          
              ),
              const SizedBox(height: 40.0,)
              
              
              ,
              const Text("les détails:"),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid
        
        
                  )
                ),
                child: TextFormField(
                  onSaved: (value){
                      _details= value;

                    },
                
                  maxLines: 10,
                  decoration:const InputDecoration(
                    hintText: "plus d info"
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              SizedBox(
                width: 300.0,
                
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     foregroundColor: Colors.white,
                     backgroundColor: Colors.blue   
                  ),
                  onPressed: (){
                  if(_formKey.currentState!.validate()){
                    // ignore: avoid_print
                    print("submitted");
                  }
          
                },
                 child:const Text("submit") ),
              )
          
              ],
          
            )
            
            
            
            ),
        ),
      ),
    );
  }
}                          