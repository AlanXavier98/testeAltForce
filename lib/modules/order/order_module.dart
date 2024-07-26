import 'package:flutter_modular/flutter_modular.dart';
import 'views/order_list_screen.dart';
import 'controllers/order_controller.dart';
import 'services/order_service.dart';

class OrderModule extends Module {
  @override
  void binds(Injector i) {
    i.add<OrderController>((i) => OrderController(Modular.get<OrderService>()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => OrderListScreen());
  }
}
