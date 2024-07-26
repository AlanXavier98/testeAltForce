import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/views/login_screen.dart';
import 'package:online_store/views/main_screen.dart';
import 'package:online_store/views/order_screens/order_list_screen.dart';
import 'package:online_store/views/order_screens/order_review_screen.dart';
import 'package:online_store/views/product_screens/cart_screen.dart';
import 'package:online_store/views/welcome_screen.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/welcome', child: (context) => WelcomeScreen());
    r.child('/main', child: (context) => MainScreen());
    r.child('/', child: (context) => LoginScreen());
    r.child('/productList', child: (context) => ProductListScreen());
    r.child('/cart', child: (context) => CartScreen());
    r.child('/orders', child: (context) => OrderListScreen());
    r.child('/rateOrder', child: (context) => OrderReviewScreen());
  }
}
