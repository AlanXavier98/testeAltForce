import 'package:get/get.dart';
import 'package:online_store/modules/order/services/order_model.dart';
import 'package:online_store/modules/order/services/order_service.dart';

class OrderController extends GetxController {
  var orders = <Order>[].obs;
  final OrderService orderService;

  OrderController(this.orderService); // Recebe o serviço de pedidos

  @override
  void onInit() {
    super.onInit();
    fetchOrders();
  }

  Future<void> fetchOrders() async {
    try {
      orders.value = await orderService.fetchOrders(); // Busca os pedidos
    } catch (e) {
      print('Error fetching orders: $e');
    }
  }

  // Método para avaliar um pedido
  void reviewOrder(Order order, double rating) {
    // Lógica para enviar a avaliação
  }
}
