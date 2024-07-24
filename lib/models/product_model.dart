class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final String category;
  final int stock;
  final double? rating; // Pode ser nulo se não houver avaliação
  final bool isOnSale; // Indica se o produto está em promoção

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    required this.stock,
    this.rating,
    this.isOnSale = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      images: List<String>.from(json['images']),
      category: json['category'],
      stock: json['stock'],
      rating: json['rating']?.toDouble(),
      isOnSale: json['isOnSale'] ?? false,
    );
  }
}
