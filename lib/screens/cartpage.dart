import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/cartmodel.dart';
import 'package:velocity_x/velocity_x.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "My Cart".text.xl.bold.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = Cart();
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cart.totalPrice}".text.xl.color(context.accentColor).make().pOnly(left: 20),
          ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not available yet!".text.bold.make(),
                      duration: Duration(seconds: 1),
                    ));
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                  ),
                  child: "Buy".text.make())
              .pOnly(right: 30)
              .wh(100, 40)
        ],
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  @override
  Widget build(BuildContext context) {
    final _cart = Cart();

    return ListView.builder(
      itemCount: _cart.items!.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(
            Icons.done,
            size: 30,
            color: context.accentColor,
          ),
          trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_circle_outline,
                size: 30,
                color: context.accentColor,
              )),
          title:
              _cart.items![index].name.text.color(context.accentColor).make(),
        );
      },
    );
  }
}
