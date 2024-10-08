import 'package:books_api_test/models/book_model.dart';
import 'package:books_api_test/models/favorite_model.dart';
import 'package:books_api_test/screens/detail_screen.dart';
import 'package:books_api_test/services/api_handler.dart';
import 'package:books_api_test/widgets/app_bar_icon.dart';
import 'package:books_api_test/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllBooksScreen extends StatelessWidget {
  const AllBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcon(
          icon: Icons.arrow_back,
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'All Books',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
        actions: [
          AppBarIcon(
            icon: Icons.shopping_cart_checkout,
            onPressed: () => context.push('/cart'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: FutureBuilder<List<BookModel>>(
          future: APIHandler.getAllBooks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('No books available at the moment.'),
              );
            }

            return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (context, index) {
                BookModel book = snapshot.data![index];
                return ChangeNotifierProvider.value(
                  value: book,
                  child: BookCard(
                    icon: Icons.favorite_border_outlined,
                    onTapAddToFavorite: () {
                      Provider.of<FavoriteModel>(context, listen: false)
                          .addItemToFavorite(book);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to favorites'),
                        ),
                      );
                    },
                    onTapGoToDetail: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            isbn: snapshot.data![index].isbn13.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },

            );
          },
        ),
      ),
    );
  }
}
