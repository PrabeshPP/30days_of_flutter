import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Center(
          child:Text("I started learning flutter again") ,
          ),

        
      drawer: Mydrawer(),
    
    );
  }
}