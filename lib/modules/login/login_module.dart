import 'package:flutter_modular/flutter_modular.dart';
import 'views/login_screen.dart';
import 'controllers/login_controller.dart';
import 'services/login_service.dart';

class LoginModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => LoginService.new),
        Bind.singleton((i) => LoginController()), // Sem injeção de dependência
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => LoginScreen()),
      ];
}
