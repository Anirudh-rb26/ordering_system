import 'package:get/get.dart';
import 'package:ordering_system/models/product_model.dart';
import 'package:ordering_system/pages/homepage.dart';

import '../constants/custom_colors.dart';

class CartController extends GetxController {
  var _items = {}.obs;

  void addToCart(MenuItem orderedItem) {
    if (_items.containsKey(orderedItem)) {
      _items[orderedItem] += 1;
    } else {
      _items[orderedItem] = 1;
    }

    Get.snackbar(
      "Dish Added",
      "${orderedItem.name} is added to cart",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 700),
      backgroundColor: CustomColors().highlightColor1.withOpacity(0.4),
      isDismissible: true,
    );
  }

  get items => _items;

  void removeItem(MenuItem orderedItem) {
    if (_items.containsKey(orderedItem) && _items[orderedItem] == 1) {
      _items.removeWhere((key, value) => key == orderedItem);
    } else if (_items.isEmpty) {
      Get.to(() => HomePage());
      Get.snackbar(
        "Cart is Empty",
        "Add items to your cart and try again",
        duration: const Duration(seconds: 1),
        backgroundColor: CustomColors().highlightColor1.withOpacity(0.4),
        isDismissible: true,
      );
    } else {
      _items[orderedItem] -= 1;
    }
  }

  get subtotal => _items.entries
      .map((orderedItem) => orderedItem.key.price * orderedItem.value)
      .toList();

  get subtotalValue {
    if (_items.isEmpty) {
      return "0.00";
    } else {
      return _items.entries
          .map((orderedItem) => orderedItem.key.price * orderedItem.value)
          .toList()
          .reduce((value, element) => value + element)
          .toStringAsFixed(2);
    }
  }
}
