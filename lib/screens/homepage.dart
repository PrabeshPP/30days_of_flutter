import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/catlog.dart';
import 'package:flutter_application_1/widgets/drawer.dart';
import 'package:flutter_application_1/widgets/itemwidget.dart';

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
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body:(CatlogModel.items !=null && CatlogModel.items!.isNotEmpty)?   ListView.builder(
          itemCount: CatlogModel.items?.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: CatlogModel.items?[index]);
          }):
          Center(child: CircularProgressIndicator(),),
      drawer: Mydrawer(),
    );
  }
}
