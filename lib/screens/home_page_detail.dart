import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Homedetailspage extends StatelessWidget {
  final catalog;

  const Homedetailspage({Key? key, this.catalog}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(),
    backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Hero(tag: Key(catalog.id.toString()),child: Image.network(catalog.image).py16())
          ],
        ).px32(),
      ),
    );
  }
}
