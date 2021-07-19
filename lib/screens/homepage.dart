import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        backgroundColor: Mytheme.creamColor,
        body: SafeArea(
          child: Container(
            
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CatlogHeader(),

                  
                ],
              )),
        ));
  }
}

class CatlogHeader extends StatelessWidget {
  const CatlogHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(Mytheme.darkBluishColor).make(),
        "Trending products".text.bold.color(Colors.red).xl.make()
      ],
      
      
    );
  }
}








