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
         TextFormField(
           decoration: InputDecoration(
             hintText: "username",
             labelText: "UserName"
              

           ),
         ),

        TextFormField(
          decoration: InputDecoration(
            hintText: "password",
            labelText: "Password"
          ),
        )
       ],
     ),
      
    );
  }
}