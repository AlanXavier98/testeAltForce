import '../repositories/product_repository.dart';
import '../../models/product_model.dart';

class ProductService {
  final ProductRepository _repository;

  ProductService(this._repository);

  Future<List<Product>> fetchProducts(String endpoint) async {
    return await _repository.getProducts(endpoint);
  }
}
