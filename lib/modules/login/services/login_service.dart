import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/modules/login/services/login_database_service.dart';

class LoginService {
  final LoginDatabaseService dbService;

  // Remova esta linha:
  // final LoginService loginService = LoginService(LoginDatabaseService());

  LoginService(this.dbService);

  Future<void> login(
      BuildContext context, String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Favor preencher os campos de E-mail e senha.'),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      Map<String, dynamic>? user = await dbService.getUser(email);
      if (user != null && user['password'] == password) {
        Modular.to.navigate('/welcome');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('E-mail ou senha incorretos.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
