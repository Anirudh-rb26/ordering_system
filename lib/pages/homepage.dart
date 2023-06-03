import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordering_system/constants/custom_colors.dart';
import 'package:ordering_system/controllers/cart_controller.dart';
import '../components/menuitem.dart';
import 'cart_screen.dart';

class HomePage extends StatelessWidget {
  final cartController = Get.put(CartController());
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: CustomColors().backgroundColor,
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (cartController.items.isEmpty) {
                Get.snackbar(
                  "Cart is empty!",
                  "Add items to your cart and then try again",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 1),
                  backgroundColor:
                      CustomColors().highlightColor1.withOpacity(0.4),
                );
              } else {
                Get.to(() => const CartScreen());
              }
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
        title: Text(
          "Restaurant ABC | Menu",
          style: TextStyle(
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            color: CustomColors().buttonColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            MenuItemFeilds(),
          ],
        ),
      ),
    );
  }
}
