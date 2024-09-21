import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/features/histoire_card.dart';


class Histoire extends StatelessWidget {
  const Histoire ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarwidget(isHome: true)
      ,
      body: ListView.builder(
        itemCount: 5
        ,itemBuilder: (BuildContext context,int index){
      
          return const HistoireCard();
      
        },),
    );
  }
}  