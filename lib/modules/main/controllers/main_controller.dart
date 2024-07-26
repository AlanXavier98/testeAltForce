import 'package:get/get.dart';
import 'package:online_store/modules/product/controllers/product_controller.dart';
import 'package:online_store/modules/product/controllers/cart_controller.dart';
import 'package:online_store/modules/product/services/product_service.dart';
import 'package:dio/dio.dart';

class MainController extends GetxController {
  final ProductController productController =
      Get.put(ProductController(ProductService(Dio())));
  final CartController cartController = Get.put(CartController());

  var selectedIndex = 0.obs;

  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  String getAppBarTitle() {
    switch (selectedIndex.value) {
      case 0:
        return 'Produtos';
      case 1:
        return 'Pedidos';
      case 2:
        return 'Carrinho';
      case 3:
        return 'Perfil';
      default:
        return 'Shop';
    }
  }
}
