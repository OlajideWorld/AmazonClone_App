import 'dart:convert';

class Products {
  final String name;
  final String description;
  final double price;
  final double quantity;
  final String category;
  final List<String> images;
  final String? id;

  Products(
      {required this.name,
      required this.description,
      required this.price,
      required this.quantity,
      required this.category,
      required this.images,
      this.id});

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
        name: map['name'] ?? "",
        description: map['description'] ?? "",
        price: map['price'] ?? "",
        quantity: map['quantity'] ?? "",
        category: map['category'] ?? "",
        images: map['images'] ?? "",
        id: map['_id']);
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      'description': description,
      "price": price,
      "quantity": quantity,
      "category": category,
      "images": images,
      "_id": id
    };
  }

  String toJson() => jsonEncode(toMap());
  factory Products.fromJson(String source) =>
      Products.fromMap(jsonDecode(source));
}
