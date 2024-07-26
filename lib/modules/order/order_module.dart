import 'package:flutter_modular/flutter_modular.dart';
import 'views/order_list_screen.dart';
import 'controllers/order_controller.dart';
import 'services/order_service.dart';

class OrderModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => OrderService.new),
        Bind.singleton((i) => OrderController(Modular.get<OrderService>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => OrderListScreen()),
      ];
}
