import 'package:books_api_test/screens/favorite_screen.dart';
import 'package:books_api_test/screens/home_screen.dart';
import 'package:books_api_test/screens/profile_screen.dart';
import 'package:books_api_test/widgets/app_bar_icon.dart';
import 'package:books_api_test/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = <Widget>[
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIcon(
            icon: Icons.menu,
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
          title: const Text(
            'The Book Store',
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
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ),
                child: Text(
                  'Book Store Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                onTap: () {
                  navigateBottomBar(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                title: const Text('Favorites'),
                onTap: () {
                  navigateBottomBar(1);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Profile'),
                onTap: () {
                  navigateBottomBar(2);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavBar(
          selectedIndex: _selectedIndex,
          onTapChange: (index) => navigateBottomBar(index),
        ),
      ),
    );
  }
}
