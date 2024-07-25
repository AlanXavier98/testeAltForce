import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class ProductController extends GetxController {
  final ProductService _productService;

  var products = <Product>[].obs;
  var filteredProducts = <Product>[].obs;
  var categories = <String>[].obs; // Lista de categorias

  ProductController(this._productService);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    products.value =
        await _productService.fetchProducts(); // Método para buscar produtos
    filteredProducts.value =
        products; // Inicialmente, os produtos filtrados são todos os produtos

    // Extrair categorias únicas
    categories.value =
        products.expand((product) => product.categories).toSet().toList();
  }

  void filterProducts(String category) {
    if (category.isEmpty) {
      filteredProducts.value =
          products; // Se nenhuma categoria for selecionada, mostrar todos os produtos
    } else {
      filteredProducts.value = products
          .where((product) => product.categories.contains(category))
          .toList();
    }
  }

  void filterOnSaleProducts() {
    filteredProducts.value =
        products.where((product) => product.isOnSale).toList();
  }
}
