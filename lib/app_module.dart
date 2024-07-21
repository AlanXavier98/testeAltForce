import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/views/login_screen.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginScreen());
  }
}
