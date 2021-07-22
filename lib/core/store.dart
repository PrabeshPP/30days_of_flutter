import 'package:flutter_application_1/models/cartmodel.dart';
import 'package:flutter_application_1/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatlogModel? catalog;
  Cart? cart;

  MyStore() {
    catalog = CatlogModel();
    cart = Cart();
    cart!.catalog = catalog;
    
  }
}
