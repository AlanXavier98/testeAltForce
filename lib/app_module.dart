import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/modules/login/login_module.dart';
import 'package:online_store/modules/main/main_module.dart';
import 'package:online_store/modules/order/order_module.dart';
import 'package:online_store/modules/product/product_module.dart';
import 'package:online_store/views/welcome_screen.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: LoginModule());
    r.module('/main', module: MainModule());
    r.module('/products', module: ProductModule());
    r.module('/orders', module: OrderModule());
    r.child('/welcomeScreen', child: (context) => WelcomeScreen());
  }
}
