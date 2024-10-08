import 'package:books_api_test/models/book_model.dart';
import 'package:books_api_test/models/favorite_model.dart';
import 'package:books_api_test/widgets/book_tile_vertical.dart';
import 'package:books_api_test/widgets/favorite_book_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Favorites',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Consumer<FavoriteModel>(
        builder: (context, favoriteModel, child) {
          if (favoriteModel.userFavorite.isEmpty) {
            return const Center(
              child: Text(
                'No favorites yet',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(15),
            child: BookTileVertical(
              itemCount: favoriteModel.userFavorite.length,
              itemBuilder: (context, index) {
                BookModel book = favoriteModel.userFavorite[index];
                return FavoriteBookTile(
                  icon: Icons.favorite,
                  onPressed: () {
                    Provider.of<FavoriteModel>(context, listen: false)
                        .removeItemFromFavorite(book);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Removed from favorites'),
                      ),
                    );
                  },
                  book: book,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
