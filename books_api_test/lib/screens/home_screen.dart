import 'package:books_api_test/widgets/book_horizon_list.dart';
import 'package:books_api_test/widgets/row_text_icon.dart';
import 'package:books_api_test/widgets/search_bar.dart' as sb;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookstore',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            sb.SearchBar(textEditingController: _textEditingController),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowTextIcon(
                      title: 'All Books',
                      icon: Icons.arrow_forward,
                      onPressed: () => context.push('/books'),
                    ),
                    const SizedBox(height: 10),
                    const RowTextIcon(
                      title: 'New & Trending',
                      icon: Icons.trending_up,
                    ),
                    const SizedBox(height: 10),
                    const BookHorizonList(),
                    const SizedBox(height: 20),
                    const RowTextIcon(
                      title: 'Popular Books',
                      icon: Icons.book,
                    ),
                    const SizedBox(height: 10),
                    const BookHorizonList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
