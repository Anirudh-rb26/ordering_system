import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ordering_system/controllers/cart_controller.dart';
import 'package:ordering_system/controllers/product_controller.dart';
import '../constants/custom_colors.dart';
import '../controllers/offer_controller.dart';

final CartController controller = Get.find();
final productController = Get.put(ProductController());
final offerController = Get.put(OfferSelectionController());
bool offerApplied = false;
dynamic finalAmmount = double.parse(controller.subtotalValue) - discountAmount;
dynamic discountAmount = 0.00;

SafeArea floatingCheckoutbar() {
  return SafeArea(
    child: Obx(
      () => Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.fromLTRB(300, 0, 300, 15),
        height: 64,
        decoration: BoxDecoration(
          color: CustomColors().backgroundColor.withOpacity(0.5),
          borderRadius: const BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: CustomColors().highlightColor2,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Align(
                alignment: Alignment.center,
                child: offerController.resetOffer.value
                    ? Text(
                        "Total: ₹${controller.subtotalValue}",
                        style: TextStyle(color: CustomColors().headlineColor),
                      )
                    : offerController.offerApplied.value
                        ? Text(
                            "Total: ₹$finalAmmount",
                            style:
                                TextStyle(color: CustomColors().headlineColor),
                          )
                        : Text(
                            "Total: ₹${controller.subtotalValue}",
                            style:
                                TextStyle(color: CustomColors().headlineColor),
                          ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                color: CustomColors().highlightColor2,
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  offerController.resetOffer.value = false;
                  if (double.parse(controller.subtotalValue) >= 1000.00) {
                    discountAmount =
                        (double.parse(controller.subtotalValue) * 0.2);
                    Get.snackbar(
                      "20% Offer Applied",
                      "20% of your total bill has been discounted",
                      duration: const Duration(milliseconds: 750),
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor:
                          CustomColors().highlightColor1.withOpacity(0.4),
                    );
                    print(controller.subtotalValue);
                    finalAmmount =
                        double.parse(controller.subtotalValue) - discountAmount;
                    print(finalAmmount);
                    offerController.showDiscountedPrice();
                  } else if (double.parse(controller.subtotalValue) <=
                          1000.00 &&
                      discountAmount >= 500.00) {
                    discountAmount =
                        (double.parse(controller.subtotalValue) * 0.1);
                    Get.snackbar(
                      "10% Offer Applied",
                      "10% of your total bill has been discounted",
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(milliseconds: 750),
                      backgroundColor:
                          CustomColors().highlightColor1.withOpacity(0.4),
                    );
                    finalAmmount =
                        double.parse(controller.subtotalValue) - discountAmount;
                    offerController.showDiscountedPrice();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColors().highlightColor2,
                ),
                icon: Icon(
                  Icons.label_important,
                  size: 24.0,
                  color: CustomColors().headlineColor,
                ),
                label: Text(
                  'Apply Coupon Codes',
                  style: TextStyle(
                    color: CustomColors().headlineColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
