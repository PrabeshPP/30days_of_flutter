import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/homepage.dart';

class Mydrawer extends StatelessWidget {
  const Mydrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
         children: [
           DrawerHeader(
             padding: EdgeInsets.zero,
             child:UserAccountsDrawerHeader(
               decoration: BoxDecoration(
                 color: Colors.white
               ),
               margin: EdgeInsets.zero,
               accountName: Text("Prabesh Bista",
               style: TextStyle(color: Colors.black),),
              accountEmail: Text("prabesh.bista1000@gmail.com",
              style: TextStyle(color: Colors.black),),
             currentAccountPicture:CircleAvatar(
               backgroundImage: AssetImage("assets/images/pic.jpg"),
             ),

             
             )),
            
            ListTile(
              leading:Icon(CupertinoIcons.home,
              color: Colors.black,
              size: 30,
              ),
              title: Text("Home",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.w600),),
            ),

            ListTile(
              leading:Icon(CupertinoIcons.profile_circled,
              color: Colors.black,
              size: 30,),
              title: Text("My Profile",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),),
            ),

                ListTile(
              leading:Icon(CupertinoIcons.cart,
              color: Colors.black,
              size: 30,),
              title: Text("Cart",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),),
            ),
              ListTile(
              
              leading:Icon(CupertinoIcons.creditcard_fill,
              color: Colors.black,
              size: 30,),
              title: Text("Payment options",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),),
            ),
            


                ListTile(
              leading:Icon(CupertinoIcons.question_circle,
              color: Colors.black,
              size: 30,),
              title: Text("Help",
              textScaleFactor: 1.2,
              style: TextStyle(color: Colors.black,
              fontWeight: FontWeight.bold),),
            )

           
         ],
        ),
      ),
      
    );
  }
}