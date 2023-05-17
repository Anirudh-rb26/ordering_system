import 'package:get/get.dart';
import 'package:ordering_system/models/product_model.dart';

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
      duration: const Duration(milliseconds: 870),
    );
  }

  get items => _items;

  void removeItem(MenuItem orderedItem) {
    if (_items.containsKey(orderedItem) && _items[orderedItem] == 1) {
      _items.removeWhere((key, value) => key == orderedItem);
    } else {
      _items[orderedItem] -= 1;
    }
  }

  get subtotal => _items.entries
      .map((orderedItem) => orderedItem.key.price * orderedItem.value)
      .toList();

  get subtotalValue => _items.entries
      .map((orderedItem) => orderedItem.key.price * orderedItem.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
}
