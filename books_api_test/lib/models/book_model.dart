import 'package:flutter/material.dart';

class BookModel extends ChangeNotifier {
  final String title;
  final String subtitle;
  final String isbn13;
  final String price;
  final String image;
  final String url;

  BookModel({
    required this.title,
    required this.subtitle,
    required this.isbn13,
    required this.price,
    required this.image,
    required this.url,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] ?? 'No Title',
      subtitle: json['subtitle'] ?? 'No Subtitle',
      isbn13: json['isbn13'] ?? 'Unknown ISBN',
      price: json['price'] ?? 'Free',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
