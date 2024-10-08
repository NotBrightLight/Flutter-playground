import 'package:books_api_test/models/cart_model.dart';
import 'package:books_api_test/models/favorite_model.dart';
import 'package:books_api_test/screens/all_books_screen.dart';
import 'package:books_api_test/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:books_api_test/screens/layout_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => CartModel(),
        ),
        ListenableProvider(
          create: (context) => FavoriteModel(),
        ),
      ],
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.purple,
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
            elevation: 0,
          ),
          iconTheme: const IconThemeData(
            color: Colors.purple,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: GoRouter(
          initialLocation: '/',
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const LayoutScreen(),
            ),
            GoRoute(
              path: '/cart',
              builder: (context, state) => const CartScreen(),
            ),
            GoRoute(
              path: '/books',
              builder: (context, state) => const AllBooksScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
