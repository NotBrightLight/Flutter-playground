import 'package:books_api_test/models/single_book_model.dart';
import 'package:books_api_test/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';

class BookTileCard extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final SingleBookModel book;

  const BookTileCard({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(8.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              book.image!,
              width: 50,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            book.title!,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            'Price: ${book.price}',
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          trailing: AppBarIcon(icon: icon, onPressed: onPressed),
        ),
      ),
    );
  }
}
