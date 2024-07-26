import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/modules/login/login_module.dart';
import 'package:online_store/modules/main/main_module.dart';
import 'package:online_store/modules/order/order_module.dart';
import 'package:online_store/modules/product/product_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: LoginModule()),
        ModuleRoute('/main', module: MainModule()),
        ModuleRoute('/products', module: ProductModule()),
        ModuleRoute('/orders', module: OrderModule()),
        ModuleRoute('/orders', module: OrderModule()),
      ];
}
