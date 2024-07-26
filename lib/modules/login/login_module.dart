import 'package:flutter_modular/flutter_modular.dart';
import 'views/login_screen.dart';
import 'controllers/login_controller.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.add<LoginController>((i) => LoginController());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => LoginScreen());
  }
}
