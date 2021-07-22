import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/screens/cartpage.dart';
import 'package:flutter_application_1/screens/homepage.dart';
import 'package:flutter_application_1/screens/loginpage.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';




void main() {
  runApp(VxState(store:MyStore() ,child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//bascially remove the debug from the top right corner
      
      themeMode:ThemeMode.light,
      theme:Mytheme.lightTheme(context) ,
      darkTheme: Mytheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.loginRoute:(context)=>Login(),
        MyRoutes.homeRoute:(context)=>Homepage(),
        MyRoutes.cartRoute:(context)=>Cartpage()
      },
    );
    
  }
} 