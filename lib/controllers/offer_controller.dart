import 'package:get/get.dart';

class OfferSelectionController extends GetxController {
  RxBool offerApplied = false.obs;
  RxBool resetOffer = false.obs;

  void showDiscountedPrice() {
    offerApplied.value = true;
  }

  void resetDiscountedPrice() {
    offerApplied.value = true;
  }

  void resetOfferValues() {
    resetOffer.value = true;
  }
}
