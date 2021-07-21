import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mytheme {
  static lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.red,
      cardColor: Colors.white,
      canvasColor: creamColor,
      buttonColor: Colors.orange,
      
      accentColor:darkBluishColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));

  static darkTheme(BuildContext context) => ThemeData(
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    buttonColor: lightBluishColor,
    accentColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: Theme.of(context).textTheme.copyWith(
          headline6: context.textTheme.headline6!.copyWith(color: Colors.white)
        ),
      ));

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color darkCreamColor = Vx.gray900;
  static Color lightBluishColor = Vx.blueGray800;
}
