import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordering_system/controllers/cart_controller.dart';
import 'package:ordering_system/controllers/product_controller.dart';
import '../constants/custom_colors.dart';

class MenuItemFeilds extends StatelessWidget {
  final productController = Get.put(ProductController());
  MenuItemFeilds({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          itemCount: productController.allitems.length,
          itemBuilder: (BuildContext context, int index) {
            return MenuItemCards(index: index);
          },
        ),
      ),
    );
  }
}

class MenuItemCards extends StatelessWidget {
  final int index;
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  MenuItemCards({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: CustomColors().buttonColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productController.allitems[index].name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: GoogleFonts.playfairDisplay().fontFamily),
                    ),
                    Text(
                      productController.allitems[index].description,
                      style: TextStyle(
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('₹${productController.allitems[index].price}'),
                    IconButton(
                      onPressed: () {
                        cartController
                            .addToCart(productController.allitems[index]);
                      },
                      icon: const Icon(Icons.add_circle),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
