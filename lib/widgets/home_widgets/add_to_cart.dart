import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cartmodel.dart';
import 'package:flutter_application_1/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Items catalog;
  const AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      final _cart = Cart();
    bool isadded = _cart.items!.contains(catalog);
    return IconButton(
        onPressed: () {
          if (!isadded) {
            isadded = isadded.toggle();
            final _catalog = CatlogModel();
            _cart.addItems(catalog);
            _cart.catalog = _catalog;
           ;
          }
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
