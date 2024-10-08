import 'package:books_api_test/screens/detail_screen.dart';
import 'package:books_api_test/services/api_handler.dart';
import 'package:books_api_test/widgets/book_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookHorizonList extends StatelessWidget {
  const BookHorizonList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: FutureBuilder(
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
              child: Text('No books available right now'),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            primary: false,
            itemCount: snapshot.data!.length > 5 ? 5 : snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              var book = snapshot.data![index];
              return ChangeNotifierProvider.value(
                value: book,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BookCard(
                    onTapGoToDetail: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            isbn: book.isbn13.toString(),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
