import 'package:flutter/material.dart';

class AppBarwidget extends StatelessWidget implements PreferredSizeWidget {
  const  AppBarwidget({required this.isHome , super.key});
  final bool isHome;

  

  @override
   Size get preferredSize => const Size.fromHeight(kToolbarHeight);

                          
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title:const Image(image: AssetImage("assets/images/sidam-logo.png")),
      backgroundColor: Colors.white,
      centerTitle: true,
      automaticallyImplyLeading: isHome,

    );
  }
}     