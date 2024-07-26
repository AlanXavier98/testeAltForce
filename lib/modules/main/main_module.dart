import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/app_module.dart';
import 'package:online_store/modules/main/controllers/main_controller.dart';
import 'package:online_store/modules/main/views/main_screen.dart';

class MainModule extends Module {
  @override
  void binds(Injector i) {
    i.add<MainController>((i) => MainController());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => MainScreen());
  }
}
