import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/pages/creation_de_police.dart';
import 'package:sidam_assurance_app/pages/histoire.dart';
import 'package:sidam_assurance_app/pages/informations_personnelles.dart';
import 'package:sidam_assurance_app/pages/polices.dart';
import 'package:sidam_assurance_app/pages/reclamation.dart';

class CardOption extends StatelessWidget {
  const CardOption ({this.imageicon="",this.optionname="",  super.key});
  final String imageicon;
  final String optionname;




  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        // ignore: avoid_print
        if(optionname== "polices d'assurance"){
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Polices()),
                );

        }
        else if(optionname=="account"){

          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const InformationsPersonnelles()));

        }
        else if(optionname == "history"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> const Histoire()));

        }
        else if(optionname=="réclamations"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> const Reclamation()  ) );

        }
        else if(optionname=="crée de police"){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> const CreationDePolice() ) );

        }

      }
      ,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.0,
            style: BorderStyle.solid,
      
          ),
          color: Colors.white
        ),
        child: Column(
         children: [ 
          Image(image:AssetImage(imageicon),
          width: 75.0,
          height: 75.0,
          ),
          const SizedBox(height: 20.0)
          ,
          Text(optionname ,
          style: const TextStyle(
            color: Colors.black
          ),)
         ],
        
        
        ),
      ),
    );
  }
}

