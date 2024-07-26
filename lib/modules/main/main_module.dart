import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/modules/main/controllers/main_controller.dart';
import 'package:online_store/modules/main/views/main_screen.dart';

class MainModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => MainController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => MainScreen()),
      ];
}
