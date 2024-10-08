import 'package:books_api_test/models/pdf_model.dart';

class SingleBookModel {
  final String? error;
  final String? title;
  final String? subtitle;
  final String? authors;
  final String? publisher;
  final String? language;
  final String? isbn10;
  final String? isbn13;
  final String? pages;
  final String? year;
  final String? rating;
  final String? desc;
  final String? price;
  final String? image;
  final String? url;
  final Pdf? pdf;

  SingleBookModel({
    this.error,
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.language,
    this.isbn10,
    this.isbn13,
    this.pages,
    this.year,
    this.rating,
    this.desc,
    this.price,
    this.image,
    this.url,
    this.pdf,
  });

  factory SingleBookModel.fromJson(Map<String, dynamic> json) {
    return SingleBookModel(
      error: json['error'] ?? '',
      title: json['title'] ?? 'No Title',
      subtitle: json['subtitle'] ?? 'No Subtitle',
      authors: json['authors'] ?? 'Unknown',
      publisher: json['publisher'] ?? 'Unknown Publisher',
      language: json['language'] ?? 'Unknown Language',
      isbn10: json['isbn10'] ?? 'Unknown ISBN10',
      isbn13: json['isbn13'] ?? 'Unknown ISBN13',
      pages: json['pages'] ?? '0',
      year: json['year'] ?? 'Unknown Year',
      rating: json['rating'] ?? '0',
      desc: json['desc'] ?? 'No Description',
      price: json['price'] ?? 'Free',
      image: json['image'] ?? '',
      url: json['url'] ?? '',
      pdf: json['pdf'] != null ? Pdf.fromJson(json['pdf']) : null,
    );
  }
}
