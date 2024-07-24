import 'package:dio/dio.dart';
import '../../models/product_model.dart';

class ProductDataSource {
  final Dio _dio;

  ProductDataSource(this._dio);

  Future<List<Product>> fetchProducts(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        List<dynamic> productsJson = response.data['products'];
        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Falha ao carregar produtos');
      }
    } catch (e) {
      print(e);
      throw Exception('Falha ao carregar produtos');
    }
  }
}
