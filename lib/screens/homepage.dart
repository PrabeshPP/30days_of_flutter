import 'dart:convert';
import 'dart:ui';

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
      body: (CatlogModel.items != null && CatlogModel.items!.isNotEmpty)
          ? GridView.builder(
            itemCount: CatlogModel.items?.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                final item = CatlogModel.items![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  
                    child: GridTile(
                      header: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item.name.toString(),
                          style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.bold),
                          ),
                          
                        ),
                        decoration: BoxDecoration(color: Colors.red),),
                    child: Image.network(item.image)
                  )
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      drawer: Mydrawer(),
    );
  }
}
