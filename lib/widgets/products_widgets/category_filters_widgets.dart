import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'filter_product_widget.dart';
import '../../controllers/product_controller.dart';

class CategoryFilters extends StatelessWidget {
  final ProductController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            // Botão para mostrar todos os produtos
            FilterProductWidget(
              label: 'Todos',
              select: controller.filteredProducts.length ==
                  controller.products.length,
              onTap: () {
                controller.filterProducts(
                    ''); // Passa uma string vazia para mostrar todos
              },
            ),
            SizedBox(width: 8), // Espaçamento entre os filtros
            ...controller.categories.map((category) {
              return Padding(
                padding: const EdgeInsets.only(
                    right: 8.0), // Adiciona espaçamento entre filtros
                child: FilterProductWidget(
                  label: category,
                  select: controller.filteredProducts
                      .any((product) => product.categories.contains(category)),
                  onTap: () {
                    // Se "Todos" estiver selecionado, desmarque-o
                    if (controller.filteredProducts.length ==
                        controller.products.length) {
                      // Se "Todos" está selecionado, desmarque e filtre pelo novo filtro
                      controller.filterProducts(category);
                    } else {
                      // Se outro filtro está selecionado, apenas filtre pelo novo filtro
                      controller.filterProducts(category);
                    }
                  },
                ),
              );
            }).toList(),
          ],
        ),
      );
    });
  }
}
