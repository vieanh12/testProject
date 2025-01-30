import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final String price;
  final String image;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  void addItem(String id, String name, String price, String image) {
    if (_items.containsKey(id)) {
      _items.update(
        id,
            (existingCartItem) => CartItem(
          id: existingCartItem.id,
          name: existingCartItem.name,
          price: existingCartItem.price,
          image: existingCartItem.image,
          quantity: existingCartItem.quantity + 1,
        ),
      );
    } else {
      _items.putIfAbsent(
        id,
            () => CartItem(
          id: id,
          name: name,
          price: price,
          image: image,
        ),
      );
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void updateQuantity(String id, int quantity) {
    if (_items.containsKey(id)) {
      if (quantity <= 0) {
        _items.remove(id);
      } else {
        _items.update(
          id,
              (existingCartItem) => CartItem(
            id: existingCartItem.id,
            name: existingCartItem.name,
            price: existingCartItem.price,
            image: existingCartItem.image,
            quantity: quantity,
          ),
        );
      }
      notifyListeners();
    }
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    _items.forEach((key, cartItem) {
      total += double.parse(cartItem.price.replaceAll('.', '').replaceAll('đ', '')) * cartItem.quantity;
    });
    return '${total.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{3})(?=\d)'), (Match m) => '${m[1]}.')}đ';
  }
}