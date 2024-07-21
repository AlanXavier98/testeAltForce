import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/views/login_screen.dart';
import 'package:online_store/views/welcome_screen.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child('/welcome', child: (context) => WelcomeScreen());
    r.child('/', child: (context) => LoginScreen());
    //r.child('/homeScreen', child: (context) => HomeScreen());
  }
}
