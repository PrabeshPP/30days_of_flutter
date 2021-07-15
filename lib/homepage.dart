import 'dart:ui';

import 'package:flutter/material.dart';
class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        title: Text("Catlog App",
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child:Text("I started learning flutter again") ,
          ),

        
      drawer:Drawer(),
    
    );
  }
}