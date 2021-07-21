import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/home_widgets/catloglist.dart';
import 'package:flutter_application_1/widgets/home_widgets/header_widgets.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_application_1/models/catlog.dart';
import 'package:flutter_application_1/widgets/themes.dart';


class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final json_file = await rootBundle.loadString("assets/files/catlog.json");
    final Decode_file = jsonDecode(json_file);
    var productsData = Decode_file["products"];
    CatlogModel.items = List.from(productsData)
        .map<Items>((item) => Items.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed:()=>Navigator.pushNamed(
        context, MyRoutes.cartRoute),
      child: Icon(CupertinoIcons.cart,)),
        backgroundColor: Mytheme.creamColor,
        body: SafeArea(
          
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatlogHeader(),
                  if (CatlogModel.items != null &&
                      CatlogModel.items!.isNotEmpty)
                    CatlogList().py16().expand()
                  else
                    Center(
                      child: CircularProgressIndicator().py64().py64().py64().py64().py32(),
                    )
                ],
              )
              ),

        )
        )
        ;
  }
}






