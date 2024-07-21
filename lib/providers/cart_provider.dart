import 'package:flutter/material.dart';
import 'package:timbu_api_app/models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<Item, int> _items = {};

  Map<Item, int> get items => _items;

  void addToCart(Item product) {
    if (_items.containsKey(product)) {
      _items[product] = _items[product]! + 1;
    } else {
      _items[product] = 1;
    }
    notifyListeners();
  }

  void removeFromCart(Item product) {
    if (_items.containsKey(product) && _items[product]! > 1) {
      _items[product] = _items[product]! - 1;
    } else {
      _items.remove(product);
    }
    notifyListeners();
  }

  void removeAllFromCart(Item product) {
    _items.remove(product);
    notifyListeners();
  }

  int getQuantity(Item product) {
    return _items[product] ?? 0;
  }

  double get totalPrice {
    double total = 0.0;
    _items.forEach((product, quantity) {
      total += product.currentPrice.first.prices['NGN'][0] * quantity;
    });
    return total;
  }
}
