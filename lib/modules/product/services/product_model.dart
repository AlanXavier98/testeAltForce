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

/*
{
  "products": [
    {
      "id": 1,
      "name": "Trator X300",
      "description": "Trator de alto desempenho para grandes lavouras.",
      "price": 50000.00,
      "images": [
        "https://dummyjson.com/tractor1.jpg",
        "https://dummyjson.com/tractor2.jpg"
      ],
      "category": "Tratores",
      "stock": 10,
      "rating": 4.8,
      "isOnSale": true
    },
    {
      "id": 2,
      "name": "Colheitadeira Y200",
      "description": "Colheitadeira eficiente para diversos tipos de grãos.",
      "price": 75000.00,
      "images": [
        "https://dummyjson.com/harvester1.jpg"
      ],
      "category": "Colheitadeiras",
      "stock": 5,
      "rating": 4.7,
      "isOnSale": false
    },
    {
      "id": 3,
      "name": "Plantadeira Z150",
      "description": "Plantadeira de precisão para culturas variadas.",
      "price": 20000.00,
      "images": [
        "https://dummyjson.com/planter1.jpg",
        "https://dummyjson.com/planter2.jpg"
      ],
      "category": "Plantadeiras",
      "stock": 20,
      "rating": 4.6,
      "isOnSale": true
    },
    {
      "id": 4,
      "name": "Pulverizador W500",
      "description": "Pulverizador de grande capacidade e alcance.",
      "price": 15000.00,
      "images": [
        "https://dummyjson.com/sprayer1.jpg"
      ],
      "category": "Pulverizadores",
      "stock": 15,
      "rating": 4.5,
      "isOnSale": false
    },
    {
      "id": 5,
      "name": "Enfardadeira V100",
      "description": "Enfardadeira compacta e eficiente.",
      "price": 10000.00,
      "images": [
        "https://dummyjson.com/baler1.jpg",
        "https://dummyjson.com/baler2.jpg"
      ],
      "category": "Enfardadeiras",
      "stock": 12,
      "rating": 4.4,
      "isOnSale": true
    },
    {
      "id": 6,
      "name": "Arado T400",
      "description": "Arado robusto para diversas condições de solo.",
      "price": 8000.00,
      "images": [
        "https://dummyjson.com/plow1.jpg"
      ],
      "category": "Arados",
      "stock": 18,
      "rating": 4.3,
      "isOnSale": false
    },
    {
      "id": 7,
      "name": "Distribuidor de Fertilizante U300",
      "description": "Distribuidor de fertilizante com alta precisão.",
      "price": 6000.00,
      "images": [
        "https://dummyjson.com/fertilizer1.jpg",
        "https://dummyjson.com/fertilizer2.jpg"
      ],
      "category": "Distribuidores",
      "stock": 25,
      "rating": 4.5,
      "isOnSale": true
    },
    {
      "id": 8,
      "name": "Carreta Agrícola S200",
      "description": "Carreta agrícola para transporte de cargas pesadas.",
      "price": 12000.00,
      "images": [
        "https://dummyjson.com/trailer1.jpg"
      ],
      "category": "Carretas",
      "stock": 8,
      "rating": 4.7,
      "isOnSale": false
    },
    {
      "id": 9,
      "name": "Semeadora Q150",
      "description": "Semeadora com sistema de precisão para diversas sementes.",
      "price": 22000.00,
      "images": [
        "https://dummyjson.com/seeder1.jpg",
        "https://dummyjson.com/seeder2.jpg"
      ],
      "category": "Semeadoras",
      "stock": 10,
      "rating": 4.6,
      "isOnSale": true
    },
    {
      "id": 10,
      "name": "Escarificador P300",
      "description": "Escarificador para preparo de solo compactado.",
      "price": 9000.00,
      "images": [
        "https://dummyjson.com/cultivator1.jpg"
      ],
      "category": "Escarificadores",
      "stock": 14,
      "rating": 4.4,
      "isOnSale": false
    },
    {
      "id": 11,
      "name": "Trator K500",
      "description": "Trator versátil para pequenas e médias propriedades.",
      "price": 45000.00,
      "images": [
        "https://dummyjson.com/tractor3.jpg",
        "https://dummyjson.com/tractor4.jpg"
      ],
      "category": "Tratores",
      "stock": 7,
      "rating": 4.8,
      "isOnSale": true
    },
    {
      "id": 12,
      "name": "Colheitadeira L350",
      "description": "Colheitadeira ideal para pequenas propriedades.",
      "price": 65000.00,
      "images": [
        "https://dummyjson.com/harvester2.jpg"
      ],
      "category": "Colheitadeiras",
      "stock": 6,
      "rating": 4.7,
      "isOnSale": false
    },
    {
      "id": 13,
      "name": "Plantadeira N200",
      "description": "Plantadeira compacta para culturas específicas.",
      "price": 18000.00,
      "images": [
        "https://dummyjson.com/planter3.jpg",
        "https://dummyjson.com/planter4.jpg"
      ],
      "category": "Plantadeiras",
      "stock": 22,
      "rating": 4.6,
      "isOnSale": true
    },
    {
      "id": 14,
      "name": "Pulverizador M400",
      "description": "Pulverizador portátil de fácil manuseio.",
      "price": 13000.00,
      "images": [
        "https://dummyjson.com/sprayer2.jpg"
      ],
      "category": "Pulverizadores",
      "stock": 19,
      "rating": 4.5,
      "isOnSale": false
    },
    {
      "id": 15,
      "name": "Enfardadeira R120",
      "description": "Enfardadeira eficiente para fardos pequenos.",
      "price": 9500.00,
      "images": [
        "https://dummyjson.com/baler3.jpg"
      ],
      "category": "Enfardadeiras",
      "stock": 13,
      "rating": 4.4,
      "isOnSale": true
    },
    {
      "id": 16,
      "name": "Arado J600",
      "description": "Arado de alto desempenho para solos difíceis.",
      "price": 8500.00,
      "images": [
        "https://dummyjson.com/plow2.jpg",
        "https://dummyjson.com/plow3.jpg"
      ],
      "category": "Arados",
      "stock": 17,
      "rating": 4.3,
      "isOnSale": false
    },
    {
      "id": 17,
      "name": "Distribuidor de Fertilizante E500",
      "description": "Distribuidor com alta capacidade de armazenamento.",
      "price": 7000.00,
      "images": [
        "https://dummyjson.com/fertilizer3.jpg"
      ],
      "category": "Distribuidores",
      "stock": 23,
      "rating": 4.5,
      "isOnSale": true
    },
    {
      "id": 18,
      "name": "Carreta Agrícola C350",
      "description": "Carreta robusta para transporte de grãos.",
      "price": 11000.00,
      "images": [
        "https://dummyjson.com/trailer2.jpg"
      ],
      "category": "Carretas",
      "stock": 9,
      "rating": 4.7,
      "isOnSale": false
    },
    {
      "id": 19,
      "name": "Semeadora D100",
      "description": "Semeadora para pequenas e médias propriedades.",
      "price": 21000.00,
      "images": [
        "https://dummyjson.com/seeder3.jpg",
        "https://dummyjson.com/seeder4.jpg"
      ],
      "category": "Semeadoras",
      "stock": 11,
      "rating": 4.6,
      "isOnSale": true
    },
    {
      "id": 20,
      "name": "Escarificador G200",
      "description": "Escarificador de fácil operação e alta eficiência.",
      "price": 8500.00,
      "images": [
        "https://dummyjson.com/cultivator2.jpg"
      ],
      "category": "Escarificadores",
      "stock": 16,
      "rating": 4.4,
      "isOnSale": false
    }
  ]
}

*/

