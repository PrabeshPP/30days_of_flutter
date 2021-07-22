import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/catlog.dart';

class Cart {
 



  CatlogModel? _catalog;
  static List<int> _itemIds = [];

  get catalog => _catalog;

  set catalog(newCatalog) {
    _catalog = newCatalog;
  }

  List<Items>? get items =>
      _itemIds.map((id) => _catalog!.getById(id)).toList();

  num get totalPrice =>
      items!.fold(0, (total, current) => total + current.price);

  void addItems(Items items) {
    _itemIds.add(items.id.toInt());
  }

  void removeItems(Items items) {
    _itemIds.remove(items.id.toInt());
  }

  _internal() {}
}
