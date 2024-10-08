import 'package:books_api_test/models/book_model.dart';
import 'package:flutter/material.dart';

class FavoriteModel extends ChangeNotifier {
  // User favorite list
  final List<BookModel> _userFavorite = [];

  // Get user favorite list
  List<BookModel> get userFavorite => List.unmodifiable(_userFavorite);

  // Add item to favorite list
  void addItemToFavorite(BookModel book) {
    if (!_userFavorite.contains(book)) {
      _userFavorite.add(book);
      notifyListeners();
    }
  }

  // Remove item from favorite list
  void removeItemFromFavorite(BookModel book) {
    _userFavorite.remove(book);
    notifyListeners();
  }

  // Check if item is in favorite list
  bool isFavorite(BookModel book) {
    return _userFavorite.contains(book);
  }

  // Clear favorite list
  void clearFavorites() {
    _userFavorite.clear();
    notifyListeners();
  }

  // Get favorite count
  int get favoriteCount => _userFavorite.length;
}
