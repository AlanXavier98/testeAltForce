import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/controllers/product_controller.dart';
import 'package:online_store/data_sources/product_data_source.dart';
import 'package:online_store/repositories/product_repository.dart';
import 'package:online_store/services/product_service.dart';
import 'package:online_store/widgets/products_widgets/category_filters_widgets.dart';
import 'package:online_store/widgets/products_widgets/grid_product_widget.dart';

class ProductListScreen extends StatelessWidget {
  final ProductController controller;

  ProductListScreen({Key? key})
      : controller = Get.put(ProductController(
            ProductService(ProductRepository(ProductDataSource(Dio()))))),
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
            icon: Icon(Icons.filter_list, color: AppColors.primaryColor),
            onPressed: () {
              // Ação ao clicar no ícone de filtro
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CategoryFilters(),
            Obx(() {
              // Usando Obx para reagir a mudanças na lista de produtos
              if (controller.products.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }
              return ProductGrid(
                  products: controller.products); // Passa a lista de produtos
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
