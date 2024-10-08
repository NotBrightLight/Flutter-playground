import 'package:books_api_test/models/cart_model.dart';
import 'package:books_api_test/widgets/app_bar_icon.dart';
import 'package:books_api_test/widgets/book_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:slide_to_act/slide_to_act.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) => Scaffold(
        appBar: AppBar(
          leading: AppBarIcon(
            icon: Icons.arrow_back,
            onPressed: () => context.pop(),
          ),
          title: const Text(
            'My Cart',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: cart.userCart.isNotEmpty
            ? Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.userCart.length,
                  itemBuilder: (context, index) {
                    return BookTileCard(
                      icon: Icons.delete,
                      onPressed: () {
                        cart.removeItemFromCart(cart.userCart[index]);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Removed from cart'),
                          ),
                        );
                      },
                      book: cart.userCart[index],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              SlideAction(
                innerColor: Colors.purple,
                outerColor: Colors.purple[200],
                sliderButtonIcon: const Icon(
                  Icons.arrow_right,
                  color: Colors.white,
                ),
                onSubmit: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Payment successful'),
                    ),
                  );
                  cart.clearCart();
                },
                child: const Text(
                  'Pay Now',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Total: \$${cart.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
            : const Center(
          child: Text('Your cart is empty'),
        ),
      ),
    );
  }
}
