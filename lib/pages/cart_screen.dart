import 'package:flutter/material.dart';
import 'package:ordering_system/components/checkout_bar.dart';
import 'package:ordering_system/widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your cart"),
      ),
      body: Column(
        children: [
          CartProducts(),
        ],
      ),
      bottomNavigationBar: floatingCheckoutbar(),
    );
  }
}
