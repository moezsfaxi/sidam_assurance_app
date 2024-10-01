import 'package:flutter/material.dart';
import 'package:sidam_assurance_app/les_polices_active.dart';
import 'package:sidam_assurance_app/testingforms/first_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';



Future  main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
  //runApp(const Testing());
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
        body: ActivePolices(useremail:"test@gmail.com")  ,
    ));
  }
}