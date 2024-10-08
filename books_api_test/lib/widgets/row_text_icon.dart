import 'package:flutter/material.dart';

class RowTextIcon extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  const RowTextIcon({
    super.key,
    required this.title,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.purple,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: Colors.purple,
              size: 28,
            ),
            splashRadius: 24.0,
          ),
        ],
      ),
    );
  }
}
