import 'package:get/get.dart';
import 'package:ordering_system/models/product_model.dart';
import 'package:ordering_system/services/firestore_db.dart';

class ProductController extends GetxController {
  final allitems = <MenuItem>[].obs;

  @override
  void onInit() {
    allitems.bindStream(FirestoreDB().getAllItems());
    super.onInit();
  }
}
