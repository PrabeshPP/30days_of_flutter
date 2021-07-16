import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: false,
        title: Text("Catlog App",
        style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child:Text("I started learning flutter again") ,
          ),

        
      drawer: Mydrawer(),
    
    );
  }
}