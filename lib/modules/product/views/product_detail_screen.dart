import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/modules/product/services/product_model.dart';
import 'package:online_store/modules/product/controllers/cart_controller.dart';
import 'package:online_store/widgets/button_padrao_widget.dart';
import 'package:online_store/widgets/secondary_screen_appBar_widget.dart'; // Adicione isso

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  final CartController cartController =
      Get.put(CartController()); // Adicione o controlador do carrinho

  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryScreenAppBarWidget(
        title: 'Detalhes do Produto',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  product.images.isNotEmpty ? product.images[0] : '',
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      'lib/assets/images/placeholder.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                product.name,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'R\$ ${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
              const SizedBox(height: 20.0),
              Text(
                product.description,
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 20.0),
              Text(
                'Categorias: ${product.categories.join(", ")}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 10.0),
              Text(
                'Avaliação: ${product.rating != null ? product.rating!.toStringAsFixed(1) : 'N/A'}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 10.0),
              Text(
                'Estoque: ${product.stock}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              if (product.isOnSale) SizedBox(height: 10.0),
              if (product.isOnSale)
                Text(
                  'Promoção!',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              SizedBox(height: 20.0),
              ButtonPadraoWidget(
                label: 'Adicionar ao Carrinho',
                func: () {
                  cartController
                      .addToCart(product); // Adiciona o produto ao carrinho
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('${product.name} adicionado ao carrinho!')),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
