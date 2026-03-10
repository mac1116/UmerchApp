class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final double originalPrice;
  final String imageUrl;
  final int stock;
  final String category;
  bool isFavorite;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.stock,
    required this.category,
    this.isFavorite = false,
  });
}

class Category {
  final String id;
  final String name;
  final String icon;

  Category({required this.id, required this.name, required this.icon});
}

class User {
  final String id;
  final String name;
  final String avatar;

  User({required this.id, required this.name, required this.avatar});
}
