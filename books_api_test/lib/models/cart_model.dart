import 'package:books_api_test/models/single_book_model.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // User cart
  final List<SingleBookModel> _userCart = [];

  // Get user cart
  List<SingleBookModel> get userCart => List.unmodifiable(_userCart);

  // Add item to cart
  void addItemToCart(SingleBookModel book) {
    if (!_userCart.contains(book)) {
      _userCart.add(book);
      notifyListeners();
    }
  }

  // Remove item from cart
  void removeItemFromCart(SingleBookModel book) {
    _userCart.remove(book);
    notifyListeners();
  }

  // Clear cart
  void clearCart() {
    _userCart.clear();
    notifyListeners();
  }

  // Get total cart price
  double get totalPrice {
    return _userCart.fold(0.0, (total, book) {
      final price = double.tryParse(book.price ?? '0') ?? 0.0;
      return total + price;
    });
  }

  // Get item count
  int get itemCount => _userCart.length;
}
