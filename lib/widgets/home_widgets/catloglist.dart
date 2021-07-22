import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cartmodel.dart';
import 'package:flutter_application_1/models/catlog.dart';
import 'package:flutter_application_1/screens/home_page_detail.dart';
import 'package:flutter_application_1/widgets/home_widgets/catlogImage.dart';
import 'package:velocity_x/velocity_x.dart';

class CatlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatlogModel.items!.length,
        itemBuilder: (context, index) {
          final catalog = CatlogModel.items![index];
          return InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Homedetailspage(
                            catalog: catalog,
                          ))),
              child: CatalogItems(catalog: catalog));
        });
  }
}

class CatalogItems extends StatelessWidget {
  final catalog;
  const CatalogItems({Key? key, this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
            tag: Key(catalog.id.toString()),
            child: CatalogImage(image: catalog.image)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name
                .toString()
                .text
                .xl
                .bold
                .color(context.accentColor)
                .make(),
            catalog.desc
                .toString()
                .text
                .textStyle(context.captionStyle!)
                .color(context.accentColor)
                .make(),
            ButtonBar(
              alignment: MainAxisAlignment.spaceAround,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}"
                    .toString()
                    .text
                    .color(Colors.red)
                    .bold
                    .make(),
                AddToCart(catalog: catalog),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepOrangeAccent),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    onPressed: () {},
                    child: "buy".toUpperCase().toString().text.make()),
              ],
            )
          ],
        ))
      ],
    )).color(context.cardColor).roundedLg.square(150).make().py16();
  }
}

class AddToCart extends StatefulWidget {
  final Items catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  _AddToCartState createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isadded = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          isadded = isadded.toggle();
          final _catalog = CatlogModel();
          final _cart = Cart();
          _cart.addItems(widget.catalog);
          _cart.catalog = _catalog;
          setState(() {});
        },
        icon: isadded
            ? Icon(Icons.done)
            : Icon(
                CupertinoIcons.cart_fill_badge_plus,
                size: 35,
                color: Colors.orange,
              ));
  }
}
