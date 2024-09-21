import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/features/app_bar.dart';
import 'package:sidam_assurance_app/features/creationcards.dart';

class CreationDePolice extends StatelessWidget {
  const CreationDePolice({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarwidget(isHome: true),
       body: ListView(
        children: const [
          CreationCards(assurance: "Assurance Agricole", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
          CreationCards(assurance: "Assurance Automobile", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
          CreationCards(assurance: "Assurance Chantiers", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
          CreationCards(assurance: "Assurance Habitation", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
          CreationCards(assurance: "Assurance Individuelle", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
          CreationCards(assurance: "Assurance Santé", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
          CreationCards(assurance: "Assurance Transport", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
          CreationCards(assurance: "Assurance Professionnelle", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
          CreationCards(assurance: "Assurance Voyage", Desc: "les bénéfices de créer une assurance professionnelle avec nous"),
      
      
      
        ],
      
      
      
      ),
    ) ;
  }
}


