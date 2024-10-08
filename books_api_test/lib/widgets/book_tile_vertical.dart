import 'package:flutter/material.dart';

class BookTileVertical extends StatelessWidget {
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;

  const BookTileVertical({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
