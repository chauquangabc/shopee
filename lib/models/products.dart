import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String title, description;
  final String id;
  final List<String> images;
  final int saleQuantity;
  final double price, discount;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.price,
    required this.discount,
    this.saleQuantity = 0,
  });
  factory Product.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Product(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      images: List<String>.from(data['images'] ?? []),
      price: (data['price'] ?? 0).toDouble(),
      discount: (data['discount'] ?? 0).toDouble(),
      saleQuantity: data['saleQuantity'] ?? 0,
    );
  }
}

