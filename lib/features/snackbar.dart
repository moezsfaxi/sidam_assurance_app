import 'package:flutter/material.dart';

void showTopSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message ,style:const TextStyle(
        color: Colors.white,
        fontFamily: "Roboto-Bold"
      ),),

      behavior: SnackBarBehavior.floating, // Makes the snackbar float
      backgroundColor: Colors.red,
      margin: const EdgeInsets.only(
        top: 50.0, // Adjust the top margin to move it near the top
        left: 10.0,
        right: 10.0,
        bottom: 20.0
      ),
      duration: const Duration(seconds: 3), // Set the duration to 1 second
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
