import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/modules/login/services/login_service.dart';
import 'package:online_store/modules/login/services/login_database_service.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginService loginService = LoginService(LoginDatabaseService());

  void login(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email and password',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    loginService.login(context, email, password);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
