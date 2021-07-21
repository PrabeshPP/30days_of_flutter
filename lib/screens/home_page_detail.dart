import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class Homedetailspage extends StatelessWidget {
  final catalog;

  const Homedetailspage({Key? key, this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:context.canvasColor,
      ),
     backgroundColor:context.canvasColor,
      bottomNavigationBar: Container(
        color: context.canvasColor,
        child: ButtonBar(
          children: [
            "\$${catalog.price}"
                .toString()
                .text
                .color(Colors.red)
                .xl2
                .bold
                .make()
                .pOnly(right:74 ),
            ElevatedButton(
              onPressed: () {},
              child: Icon(
                CupertinoIcons.cart_badge_plus,
                size: 30,
                color: Colors.white,
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                  shape: MaterialStateProperty.all(StadiumBorder())),
            ).wh(100, 40),
            ElevatedButton(
                    onPressed: () {},
                    child: "Buy".toString().text.bold.make(),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
                        shape: MaterialStateProperty.all(StadiumBorder())))
                .wh(90, 40),
          ],
        ),
      ),
      
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image).py16())
                .h32(context),
            Expanded(
                child: VxArc(
              
              height: 20.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.toString().text.color(context.accentColor).xl4.bold.make(),
                    catalog.desc
                        .toString()
                        .text
                        .xl
                        .color(context.accentColor)
                        .textStyle(context.captionStyle!)
                        .make(),
                    "Sit elitr voluptua aliquyam et accusam sit duo, sit diam aliquyam elitr amet, elitr labore sit sit stet et kasd aliquyam dolore, amet elitr accusam sed sed ut et tempor, ut lorem labore accusam et erat invidunt ipsum dolore. Voluptua."
                        .text
                        .color(context.accentColor)
                        .textStyle(context.captionStyle!)
                        .make()
                        .p16()
                  ],
                ).py32(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
