import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor:context.canvasColor ,
      ),
      body:Container(
        child: Center(child: "Comming Soon!".text.bold.xl.make()),
      ) ,
      
    
    );
  }
}