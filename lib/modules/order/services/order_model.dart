import '../../product/services/product_model.dart';

class Order {
  final int id;
  final String name;
  final String orderDate;
  final String deliveryDate;
  final List<Product> products;
  final String status; // Status do pedido

  Order({
    required this.id,
    required this.name,
    required this.orderDate,
    required this.deliveryDate,
    required this.products,
    required this.status,
  });

  // Método factory para criar um Order a partir de um JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      name: json['name'],
      orderDate: json['orderDate'],
      deliveryDate: json['deliveryDate'],
      products: (json['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
      status: json['status'] ?? 'Sem estatus',
    );
  }
}
/*/
[
  {
    "id": 1,
    "name": "Pedido 1",
    "orderDate": "2024-07-20",
    "deliveryDate": "2024-07-25",
    "status": "Aguardando Pagamento",
    "products": [
      {
        "id": 1,
        "name": "Trator X300",
        "description": "Trator de alto desempenho para grandes lavouras.",
        "price": 50000.00,
        "images": ["https://dummyjson.com/tractor1.jpg"],
        "categories": ["Tratores"],
        "stock": 10,
        "rating": 4.8,
        "isOnSale": true
      },
      {
        "id": 2,
        "name": "Colheitadeira Y200",
        "description": "Colheitadeira eficiente para diversos tipos de grãos.",
        "price": 75000.00,
        "images": ["https://dummyjson.com/harvester1.jpg"],
        "categories": ["Colheitadeiras"],
        "stock": 5,
        "rating": 4.7,
        "isOnSale": false
      }
    ]
  },
  {
    "id": 2,
    "name": "Pedido 2",
    "orderDate": "2024-07-21",
    "deliveryDate": "2024-07-26",
    "status": "Em Separação",
    "products": [
      {
        "id": 3,
        "name": "Pulverizador W500",
        "description": "Pulverizador de grande capacidade e alcance.",
        "price": 15000.00,
        "images": ["https://dummyjson.com/sprayer1.jpg"],
        "categories": ["Pulverizadores"],
        "stock": 15,
        "rating": 4.5,
        "isOnSale": false
      }
    ]
  },
  {
    "id": 3,
    "name": "Pedido 3",
    "orderDate": "2024-07-22",
    "deliveryDate": "2024-07-27",
    "status": "A Caminho",
    "products": [
      {
        "id": 4,
        "name": "Enfardadeira V100",
        "description": "Enfardadeira compacta e eficiente.",
        "price": 10000.00,
        "images": ["https://dummyjson.com/baler1.jpg"],
        "categories": ["Enfardadeiras"],
        "stock": 12,
        "rating": 4.4,
        "isOnSale": true
      },
      {
        "id": 5,
        "name": "Arado T400",
        "description": "Arado robusto para diversas condições de solo.",
        "price": 8000.00,
        "images": ["https://dummyjson.com/plow1.jpg"],
        "categories": ["Arados"],
        "stock": 18,
        "rating": 4.3,
        "isOnSale": false
      }
    ]
  },
  {
    "id": 4,
    "name": "Pedido 4",
    "orderDate": "2024-07-23",
    "deliveryDate": "2024-07-28",
    "status": "Entregue",
    "products": [
      {
        "id": 6,
        "name": "Plantadeira Z150",
        "description": "Plantadeira de precisão para culturas variadas.",
        "price": 20000.00,
        "images": ["https://dummyjson.com/planter1.jpg"],
        "categories": ["Plantadeiras"],
        "stock": 20,
        "rating": 4.6,
        "isOnSale": true
      }
    ]
  },
  {
    "id": 5,
    "name": "Pedido 5",
    "orderDate": "2024-07-24",
    "deliveryDate": "2024-07-29",
    "status": "Entregue",
    "products": [
      {
        "id": 7,
        "name": "Trator X500",
        "description": "Trator de alto desempenho para grandes lavouras.",
        "price": 55000.00,
        "images": ["https://dummyjson.com/tractor2.jpg"],
        "categories": ["Tratores"],
        "stock": 5,
        "rating": 4.9,
        "isOnSale": true
      }
    ]
  }
]

*/
