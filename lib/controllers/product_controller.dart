import '../services/product_service.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  final ProductService _productService;

  var products = <Product>[].obs;

  ProductController(this._productService);

  @override
  void onInit() {
    super.onInit();
    fetchProducts(); // Chama o método para buscar produtos da API
  }

  void fetchProducts() async {
    products.value = await _productService.fetchProducts(
        'https://dummyjson.com/c/8887-910c-4bc7-b212'); // Passa o endpoint
  }
}
