import 'package:flutter_application_1/core/store.dart';
import 'package:flutter_application_1/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart {
  CatlogModel? _catalog;
  final List<int> _itemIds = [];

  get catalog => _catalog;

  set catalog(newCatalog) {
    _catalog = newCatalog;
  }

  List<Items>? get items =>
      _itemIds.map((id) => _catalog!.getById(id)).toList();

  num get totalPrice =>
      items!.fold(0, (total, current) => total + current.price);



}

class AddMutation extends VxMutation<MyStore> {
  final Items items;

  AddMutation(this.items);

  @override
  perform() {
    store!.cart!._itemIds.add(items.id.toInt());
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Items items;

  RemoveMutation(this.items);
  @override
  perform() {
    store!.cart!._itemIds.remove(items.id);
  }
}
