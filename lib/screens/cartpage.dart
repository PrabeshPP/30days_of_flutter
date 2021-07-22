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
          "\$${_cart.totalPrice}"
              .text
              .xl
              .color(context.accentColor)
              .make()
              .pOnly(left: 20),
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

class _CartList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final _cart = Cart();

    return _cart.items!.isEmpty
        ? Nothing()
        : ListView.builder(
          
            itemCount: _cart.items!.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(_cart.items![index].image,
                ).py12()
                ,
                trailing: IconButton(
                    onPressed: () {
                      _cart.removeItems(_cart.items![index]);
                      ;
                    },
                    icon: Icon(
                      Icons.remove_circle_outline,
                      size: 30,
                      color: Colors.red,
                    )),
                title: _cart.items![index].name.text
                    .color(context.accentColor)
                    .make(),
              );
            },
          );
  }
}

class Nothing extends StatelessWidget {
  const Nothing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return "Nothing to show".text.xl3.makeCentered();
  }
}
