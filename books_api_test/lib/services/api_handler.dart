import 'dart:convert';

import 'package:books_api_test/models/book_model.dart';
import 'package:books_api_test/models/single_book_model.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  static const String _baseUrl = 'api.itbook.store';

  // Fetch all books
  static Future<List<BookModel>> getAllBooks() async {
    Uri uri = Uri.https(_baseUrl, '/1.0/new');
    var response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load books');
    }

    var data = jsonDecode(response.body);
    List<BookModel> bookList = [];

    for (var eachData in data['books']) {
      final book = BookModel(
        image: eachData['image'],
        isbn13: eachData['isbn13'],
        price: eachData['price'],
        subtitle: eachData['subtitle'],
        title: eachData['title'],
        url: eachData['url'],
      );
      bookList.add(book);
    }

    return bookList;
  }

  // Fetch a single book by ISBN
  static Future<SingleBookModel> getSingleBook({required String isbn}) async {
    Uri uri = Uri.https(_baseUrl, '/1.0/books/$isbn');
    var response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load book details');
    }

    var data = jsonDecode(response.body);
    return SingleBookModel.fromJson(data);
  }
}
