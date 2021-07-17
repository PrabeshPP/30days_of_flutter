import 'dart:ui';

import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final  item;

  const ItemWidget({Key? key, @required this.item})
      :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
      
        elevation: 2.0,
        child: ListTile(
          leading: Image.network(item.image,
          ),
          title: Text(item.name),
          subtitle: Text(item.desc),
          trailing: Text("\$.${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepOrange,
            fontWeight: FontWeight.bold
          ),),
          
        ),
      ),
    );
  }
}
