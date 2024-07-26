import 'package:dio/dio.dart';
import 'product_model.dart';

class ProductService {
  final Dio dio;

  ProductService(this.dio);

  Future<List<Product>> fetchProducts() async {
    final response =
        await dio.get('https://dummyjson.com/c/96a6-6de1-4f48-a811');
    if (response.statusCode == 200) {
      return (response.data['products'] as List)
          .map((product) => Product.fromJson(product))
          .toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
