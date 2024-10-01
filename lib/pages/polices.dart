import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/features/polices_card.dart';

class Polices extends StatelessWidget {
  const Polices({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarwidget(isHome: true,)
      ,
      body: ListView(
       
        padding:const EdgeInsets.all(8.0),
       children:[
        // const  PolicesCard(),
        // SizedBox(height: MediaQuery.of(context).size.width*0.05),
        // const  PolicesCard(),
        // SizedBox(height: MediaQuery.of(context).size.width*0.05),
        // const  PolicesCard(),
        // SizedBox(height: MediaQuery.of(context).size.width*0.05),
        // const  PolicesCard(),
        // SizedBox(height: MediaQuery.of(context).size.width*0.05),
        // const  PolicesCard(),
        // SizedBox(height: MediaQuery.of(context).size.width*0.05),
        // const  PolicesCard(),
        // SizedBox(height: MediaQuery.of(context).size.width*0.05),




       ],
      
      
        ),
    );
  }
}  