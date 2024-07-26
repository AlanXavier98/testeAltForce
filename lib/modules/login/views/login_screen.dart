import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:online_store/modules/login/controllers/login_controller.dart';
import 'package:online_store/widgets/button_padrao_widget.dart';
import 'package:online_store/modules/login/views/widgets/input_login_widget.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Spacer(),
                      Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Good to see you back! 💙',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 30),
                      // Email Input
                      InputWidget(
                        ctrl: controller.emailController,
                        label: "E-mail",
                        isPass: false,
                      ),
                      const SizedBox(height: 20),
                      // Password Input
                      InputWidget(
                        ctrl: controller.passwordController,
                        label: '*********',
                        isPass: true,
                      ),
                      const SizedBox(height: 20),
                      // Access Button
                      ButtonPadraoWidget(
                        label: "Next",
                        func: () {
                          controller.login(context);
                          Modular.to.navigate('/welcomeScreen');
                        },
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
