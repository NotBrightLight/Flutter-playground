import 'package:books_api_test/models/book_model.dart';
import 'package:books_api_test/widgets/app_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookCard extends StatelessWidget {
  final VoidCallback onTapGoToDetail;
  final VoidCallback? onTapAddToFavorite;
  final IconData? icon;
  final bool isFavorite;

  const BookCard({
    super.key,
    required this.onTapGoToDetail,
    this.onTapAddToFavorite,
    this.icon,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure the BookModel is not null
    BookModel? bookModelProvider = Provider.of<BookModel?>(context);

    if (bookModelProvider == null) {
      return const Center(child: Text('Book not available'));
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTapGoToDetail,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(5),
          width: 200,
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 10,
                child: ClipRRect(
                  child: Image.network(
                    bookModelProvider.image,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  bookModelProvider.price,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              if (icon != null && onTapAddToFavorite != null)
                AppBarIcon(
                  icon: icon!,
                  onPressed: onTapAddToFavorite!,
                  iconColor: isFavorite ? Colors.red : Colors.purple,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
