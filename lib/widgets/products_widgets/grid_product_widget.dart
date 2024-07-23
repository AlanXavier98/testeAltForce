import 'package:flutter/material.dart';
import 'package:online_store/widgets/products_widgets/card_product_widget.dart';

class ProductGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.75, // Ajuste a proporção do card aqui
        ),
        itemCount: 10, // Substitua com o número real de produtos
        itemBuilder: (context, index) {
          return CardProductWidget();
        },
      ),
    );
  }
}
