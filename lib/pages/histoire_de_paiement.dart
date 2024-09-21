import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
//import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/features/my_history_card.dart';

class HistoireDePaiement extends StatelessWidget {
  const HistoireDePaiement({super.key});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: const AppBarwidget(isHome: true),
      body: ListView(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
            children:[
               const MyHistoryCard(),
               SizedBox(height: MediaQuery.of(context).size.width*0.05),
               const MyHistoryCard(),
               SizedBox(height: MediaQuery.of(context).size.width*0.05),
               const MyHistoryCard(),
               SizedBox(height: MediaQuery.of(context).size.width*0.05),
               const MyHistoryCard(),
               SizedBox(height: MediaQuery.of(context).size.width*0.05),
               const MyHistoryCard(),
               SizedBox(height: MediaQuery.of(context).size.width*0.05),
               const MyHistoryCard(),
        
            ],
          ),
    ) ;
  }
}