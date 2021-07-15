import 'dart:ui';

import 'package:flutter/material.dart';
class  Login extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
     
     child: Column(
       children: [
         Image.asset("assets/images/log.png",fit: BoxFit.cover),
         SizedBox(
           height: 50,
         ),
         Text("Welcome",style: TextStyle(fontSize: 20
         ,color: Colors.deepPurple,fontWeight: FontWeight.bold

         ),
         ),
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
           child: Column(
             children: [
               TextFormField(
                 cursorColor: Colors.lightBlue,
                 decoration: InputDecoration(
                    labelText: "UserName",
                   hintText: "Enter Username",
                   labelStyle:TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide()
                  )
                    

                 ),
                 
               ),
               SizedBox(
                 height: 10,
               ),

        TextFormField(
          obscureText: true,
                decoration: InputDecoration(
                   labelText: "Password",
                  hintText: "Enter Password",
                  labelStyle: TextStyle(color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.deepPurple
                    ),
                  ),
                 border: OutlineInputBorder(
                   borderSide: BorderSide()
                 )
                ),
        ),
        SizedBox(
          height: 20,
        ),

        ElevatedButton(child: Text("Login"),
        onPressed: (){

        },
      style:ButtonStyle(shape:),
        )
             ],
             
           ),
         )
       ],
     ),
      
    );
  }
}