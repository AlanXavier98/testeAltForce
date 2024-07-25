import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/controllers/product_controller.dart';
import 'package:online_store/services/product_service.dart';
import 'package:online_store/widgets/products_widgets/category_filters_widgets.dart';
import 'package:online_store/widgets/products_widgets/grid_product_widget.dart';
import 'package:online_store/controllers/cart_controller.dart';

class ProductListScreen extends StatelessWidget {
  final ProductController controller;
  final CartController cartController = Get.put(CartController());

  ProductListScreen({Key? key})
      : controller = Get.put(ProductController(ProductService(Dio()))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shop',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: AppColors.primaryColor),
            onPressed: () {
              // Navegar para a tela do carrinho
              // Modular.to.pushNamed('/cart'); // Se estiver usando Modular
              Navigator.pushNamed(
                  context, '/cart'); // Se estiver usando Navigator
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CategoryFilters(),
            SizedBox(height: 15),
            Obx(() {
              if (controller.filteredProducts.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return ProductGrid(products: controller.filteredProducts);
            }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: AppColors.primaryColor,
      ),
    );
  }
}
