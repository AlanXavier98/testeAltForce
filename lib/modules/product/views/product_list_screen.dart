import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/modules/product/controllers/product_controller.dart';
import 'package:online_store/modules/product/controllers/cart_controller.dart';
import 'package:online_store/modules/product/views/products_widgets/category_filters_widgets.dart';
import 'package:online_store/modules/product/views/products_widgets/grid_product_widget.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController controller = Get.find();
    final CartController cartController = Get.find();

    return Scaffold(
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
    );
  }
}
