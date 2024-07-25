class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final List<String> categories; // Mudança: Agora é uma lista de categorias
  final int stock;
  final double? rating; // Pode ser nulo se não houver avaliação
  final bool isOnSale; // Indica se o produto está em promoção

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.categories, // Mudança: lista de categorias
    required this.stock,
    this.rating,
    this.isOnSale = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Nome não disponível',
      description: json['description'] ?? 'Descrição não disponível',
      price: (json['price'] != null ? json['price'].toDouble() : 0.0),
      images: json['images'] != null ? List<String>.from(json['images']) : [''],
      categories: json['category'] != null
          ? List<String>.from(json['category'].split(', '))
          : [
              'Categoria não disponível'
            ], // Mudança: dividindo a string de categorias
      stock: json['stock'] ?? 0,
      rating: json['rating'] != null ? json['rating'].toDouble() : null,
      isOnSale: json['isOnSale'] ?? false, // Corrigido para usar isOnSale
    );
  }
}
