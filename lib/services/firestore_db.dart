import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ordering_system/models/product_model.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<MenuItem>> getAllItems() {
    return _firebaseFirestore
        .collection('menuItems')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => MenuItem.fromSnapshot(doc)).toList();
    });
  }
}
