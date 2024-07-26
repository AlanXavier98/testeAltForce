import 'package:flutter/material.dart';
import 'package:online_store/modules/product/services/product_model.dart';
import 'package:online_store/modules/product/views/products_widgets/card_product_widget.dart';

class ProductGrid extends StatelessWidget {
  final List<Product> products; // Lista de produtos

  ProductGrid({required this.products}); // Construtor que recebe a lista

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75,
        ),
        itemCount: products.length, // Número real de produtos
        itemBuilder: (context, index) {
          return CardProductWidget(product: products[index]); // Passa o produto
        },
      ),
    );
  }
}
