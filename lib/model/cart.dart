import 'package:add_cart_provider/model/item.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  final List<Item> _items = [];
  double _price = 0.0;
  final Map<Item, int> _itemQuantities = {};
  void addItem(Item item) {
    if (_itemQuantities.containsKey(item)) {
      _itemQuantities[item] = _itemQuantities[item]! + 1;
    } else {
      _itemQuantities[item] = 1;
      _items.add(item);
    }
    _price += item.price;
    notifyListeners();
  }

  int get count {
    return _items.length;
  }

  double get totalPrice {
    return _price;
  }

  List<Item> get items {
    return _items;
  }

  void increaseQuantity(Item item) {
    _itemQuantities[item] = (_itemQuantities[item] ?? 0) + 1;
    _price += item.price;
    notifyListeners();
  }

  void decreaseQuantity(Item item) {
    if (_itemQuantities[item]! > 1) {
      _itemQuantities[item] = _itemQuantities[item]! - 1;
      _price -= item.price;
      notifyListeners();
    } else {
      removeItem(item);
    }
  }

  int getQuantity(Item item) {
    return _itemQuantities[item] ?? 0;
  }

  void removeItem(Item item) {
    if (_itemQuantities.containsKey(item)) {
      _price -= item.price * _itemQuantities[item]!;
      _itemQuantities.remove(item);
      _items.remove(item);
      notifyListeners();
    }
  }
}
