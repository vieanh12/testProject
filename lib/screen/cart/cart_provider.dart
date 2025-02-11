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

  Map<String, CartItem> get items => {..._items};

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }

  void addItem({
    required String id,
    required String name,
    required String price,
    required String image,
  }) {
    if (_items.containsKey(id)) {
      // Nếu sản phẩm đã tồn tại, tăng số lượng
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
      // Nếu sản phẩm chưa tồn tại, thêm mới
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

  void updateQuantity(String id, int quantity) {
    if (!_items.containsKey(id)) return;

    if (quantity <= 0) {
      removeItem(id);
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
      notifyListeners();
    }
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  String calculateTotal() {
    double total = 0;
    _items.forEach((key, cartItem) {
      // Chuyển đổi giá từ string (VD: "150,000đ") sang double
      String priceStr = cartItem.price.replaceAll(RegExp(r'[^\d]'), '');
      double price = double.parse(priceStr);
      total += price * cartItem.quantity;
    });

    // Định dạng số theo format tiền Việt Nam
    return '${total.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
            (Match m) => '${m[1]},'
    )}đ';
  }
}