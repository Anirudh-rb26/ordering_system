import 'package:flutter/material.dart';
import 'package:ordering_system/components/checkout_bar.dart';
import 'package:ordering_system/constants/custom_colors.dart';
import 'package:ordering_system/widgets/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors().backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text("Your Cart"),
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
