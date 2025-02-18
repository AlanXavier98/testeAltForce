import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/modules/product/controllers/cart_controller.dart';
import 'package:online_store/modules/product/views/products_widgets/card_product_widget.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (cartController.cartItems.isEmpty) {
        return Center(child: Text('O carrinho está vazio.'));
      }
      return ListView.builder(
        itemCount: cartController.cartItems.length,
        itemBuilder: (context, index) {
          final product = cartController.cartItems[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: CardProductWidget(
              product: product,
              onRemove: () {
                cartController
                    .removeFromCart(product); // Remove o produto do carrinho
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text('${product.name} removido do carrinho!')),
                );
              },
            ),
          );
        },
      );
    });
  }
}
