import 'package:flutter_modular/flutter_modular.dart';
import 'views/product_list_screen.dart';
import 'controllers/product_controller.dart';
import 'services/product_service.dart';

class ProductModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => ProductService.new),
        Bind.singleton((i) => ProductController(Modular.get<ProductService>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => ProductListScreen()),
      ];
}
