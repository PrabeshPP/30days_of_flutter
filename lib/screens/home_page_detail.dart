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
      
      
    ),
    bottomNavigationBar:ButtonBar(
      
      alignment: MainAxisAlignment.spaceBetween,
      children: [
        "\$${catalog.price}".toString().text.color(Colors.red).xl2.bold.make(),
        ElevatedButton(onPressed: (){}, 
        
        child:"Buy".toString().text.bold.make(),
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(Colors.orange),
          shape: MaterialStateProperty.all(StadiumBorder())
        )
        ).wh(100, 50),
      ],
    ) ,
    backgroundColor:Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(tag: Key(catalog.id.toString()),child: Image.network(catalog.image).py16()).h32(context),
            Expanded(
              child: VxArc(
                height: 20.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,

                child: Container(
                color: Mytheme.creamColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                  catalog.name.toString().text.xl4.bold.make(),
                  catalog.desc.toString().text.xl.textStyle(context.captionStyle!).make(),
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
