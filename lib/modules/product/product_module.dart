import 'package:flutter_modular/flutter_modular.dart';
import 'views/product_list_screen.dart';
import 'controllers/product_controller.dart';
import 'services/product_service.dart';

class ProductModule extends Module {
  @override
  void binds(Injector i) {
    i.add<ProductController>(
        (i) => ProductController(Modular.get<ProductService>()));
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => ProductListScreen());
  }
}
