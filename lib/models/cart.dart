import 'package:flutter/widgets.dart';
import 'package:provider_shop/models/CatalogModel.dart';

class CartModel extends ChangeNotifier{

  late CatalogModel _catalog;

  final List<int> _itemsIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;

    notifyListeners();
  }

  List<Item> get items => _itemsIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice => items.fold(0, (total, current) => total + current.price);

  void add(Item item){
    _itemsIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item){
    _itemsIds.remove(item.id);
    notifyListeners();
  }

}