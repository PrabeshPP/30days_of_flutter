import 'dart:convert';
import 'dart:ui';

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
                  if (CatlogModel.items != null &&
                      CatlogModel.items!.isNotEmpty)
                    CatlogList().expand()
                  else
                    Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              )),
        ));
  }
}

class CatlogHeader extends StatelessWidget {
  const CatlogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catlog App".text.xl5.bold.color(Mytheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make()
      ],
    );
  }
}

class CatlogList extends StatelessWidget {
  const CatlogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatlogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatlogModel.items![index];
        return CatlogItem(catalog: catalog);
      },
    );
  }
}

class CatlogItem extends StatelessWidget {
  final catalog;

  const CatlogItem({Key? key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CatlogImage(
      image: catalog.image,
      name: catalog.name,
      price: catalog.price,
      desc:catalog.desc
    );
  }
}

class CatlogImage extends StatelessWidget {
  final String image;
  final String name;
  final String desc;
  final num price;

  const CatlogImage({
    Key? key,
    required this.image,
    required this.name,
    required this.desc,
    required this.price,
  }) : super(key: key);
      

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Image.network(image).box.make().p16().w40(context),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            name.text.bold.color(Mytheme.darkBluishColor).make(),
            desc.text.textStyle(context.captionStyle!).make(),
            10.heightBox,
          ButtonBar(alignment: MainAxisAlignment.spaceBetween,
          buttonPadding:EdgeInsets.zero,
            children: [
            "\$$price".text.bold.lg.red600.make(),
            ElevatedButton(
              clipBehavior: Clip.antiAlias,
              onPressed: (){
            },
               style: ElevatedButton.styleFrom(
                 minimumSize: Size(70, 40),
                 shape:RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(20.0)) ,
              primary:Colors.orangeAccent,
             ),
             child: "Buy".text.bold.white.make(),
         
            )
          ],).pOnly(right: 8.0)
            ],
        ))
      ],
    )).white.roundedLg.square(150).make().py16();
  }
}
