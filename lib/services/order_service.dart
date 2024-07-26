import 'package:dio/dio.dart';
import '../models/order_model.dart';

class OrderService {
  final Dio dio;

  OrderService(this.dio);

  Future<List<Order>> fetchOrders() async {
    final response =
        await dio.get('https://dummyjson.com/c/78f8-d940-4f44-ac4d');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((order) => Order.fromJson(order))
          .toList();
    } else {
      throw Exception('Erro em pedido.');
    }
  }
}
