import 'package:cloud_firestore/cloud_firestore.dart';

class MenuItem {
  final String name;
  final String description;
  final int price;

  const MenuItem({
    required this.name,
    required this.description,
    required this.price,
  });

  static MenuItem fromSnapshot(DocumentSnapshot snap) {
    MenuItem item = MenuItem(
      name: snap['name'],
      description: snap['description'],
      price: snap['price'],
    );

    return item;
  }
}
