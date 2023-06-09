import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ordering_system/components/checkout_bar.dart';
import 'package:ordering_system/constants/custom_colors.dart';
import 'package:ordering_system/controllers/cart_controller.dart';
import 'package:ordering_system/controllers/offer_controller.dart';
import 'package:ordering_system/models/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  final offerController = Get.put(OfferSelectionController());
  CartProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: 600,
        child: ListView.builder(
          itemCount: controller.items.length,
          itemBuilder: (BuildContext context, index) {
            return CartCard(
              controller: controller,
              menuItem: controller.items.keys.toList()[index],
              quantitiy: controller.items.values.toList()[index],
              index: index,
            );
          },
        ),
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  final CartController controller;
  final MenuItem menuItem;
  final int quantitiy;
  final int index;

  const CartCard({
    super.key,
    required this.controller,
    required this.menuItem,
    required this.quantitiy,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        height: 30,
        decoration: DottedDecoration(
          shape: Shape.line,
          linePosition: LinePosition.bottom,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              menuItem.name,
              style: TextStyle(
                fontFamily: GoogleFonts.neucha().fontFamily,
                color: CustomColors().headlineColor,
                fontSize: 16,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    controller.addToCart(menuItem);
                    offerController.resetOfferValues();
                    offerController.resetDiscountedPrice();
                    Get.snackbar(
                      "Discount Removed",
                      "Discount has been removed, Press Apply Coupons to check for new coupons.",
                      duration: const Duration(milliseconds: 800),
                      backgroundColor:
                          CustomColors().highlightColor1.withOpacity(0.4),
                      isDismissible: true,
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  },
                  icon: Icon(
                    Icons.add_circle,
                    color: CustomColors().headlineColor,
                  ),
                ),
                Text(
                  '$quantitiy',
                  style: TextStyle(
                    color: CustomColors().headlineColor,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    controller.removeItem(menuItem);
                    offerController.resetOfferValues();
                    offerController.resetDiscountedPrice();
                    Get.snackbar(
                      "Discount Removed",
                      "Discount has been removed, Press Apply Coupons to check for new coupons.",
                      duration: const Duration(milliseconds: 800),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor:
                          CustomColors().highlightColor1.withOpacity(0.4),
                      isDismissible: true,
                    );
                  },
                  icon: Icon(
                    Icons.remove_circle,
                    color: CustomColors().headlineColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
