import '../data_sources/product_data_source.dart';
import '../../models/product_model.dart';

class ProductRepository {
  final ProductDataSource _dataSource;

  ProductRepository(this._dataSource);

  Future<List<Product>> getProducts(String endpoint) async {
    return await _dataSource.fetchProducts(endpoint);
  }
}
