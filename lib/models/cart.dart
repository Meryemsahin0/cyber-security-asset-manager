import 'package:flutter/material.dart'; // Bu satır şart!
import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Sepetteki toplam ürün sayısı
  int get itemCount => _items.fold(0, (sum, item) => sum + item.quantity);

  // Toplam fiyat
  double get totalPrice => _items.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));

  // Sepete ekle
  void addToCart(Product product) {
    var index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product, quantity: 1));
    }
    notifyListeners(); // Arayüzü güncellemek için şart!
  }

  // Ürünü tamamen sil
  void removeFromCart(Product product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  // Ürün sayısını artır/azalt
  void updateQuantity(Product product, int quantity) {
    var index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      if (quantity > 0) {
        _items[index].quantity = quantity;
      } else {
        _items.removeAt(index); // Sayı 0 olursa sil
      }
      notifyListeners();
    }
  }
}