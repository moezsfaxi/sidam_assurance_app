import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_agricole.dart';
import 'package:sidam_assurance_app/polices_forms/assurance_sante.dart';
import 'package:sidam_assurance_app/testingforms/first_page.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidam',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 175, 214, 247)),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home:  const Scaffold(
      
        body: FirstPage(),

      ) ,
    );
  }
}

//testing

class Testing extends StatelessWidget {
  const Testing({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sidam',
      theme: ThemeData(
  
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const Scaffold(
        //appBar: AppBarwidget(isHome: true),
        body: AssuranceSante()  ,
    ));
  }
}