import 'package:books_api_test/models/cart_model.dart';
import 'package:books_api_test/services/api_handler.dart';
import 'package:books_api_test/widgets/app_bar_icon.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String isbn;
  const DetailScreen({super.key, required this.isbn});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: AppBarIcon(
          icon: Icons.arrow_back,
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Book Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: APIHandler.getSingleBook(isbn: isbn),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData) {
            return const Center(
              child: Text('No book found'),
            );
          }

          var book = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FancyShimmerImage(
                    imageUrl: book.image!,
                    height: size.height * 0.4,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    book.title!,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[200],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    book.subtitle!,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.purple[200],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price: ${book.price}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Rating: ${book.rating}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text('Published: ${book.year}'),
                  Text('Author: ${book.authors}'),
                  Text('Pages: ${book.pages}'),
                  const Divider(),
                  const SizedBox(height: 10),
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[200],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    book.desc!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FutureBuilder(
        future: APIHandler.getSingleBook(isbn: isbn),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          var book = snapshot.data!;
          return FloatingActionButton(
            onPressed: () {
              Provider.of<CartModel>(context, listen: false)
                  .addItemToCart(book);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to cart')),
              );
            },
            backgroundColor: Colors.purple,
            child: const Icon(Icons.add_shopping_cart),
          );
        },
      ),
    );
  }
}
