import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/controllers/login_controller.dart';
import 'package:online_store/widgets/input_login_widget.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo
            //Image.asset('assets/images/logoExperweb.png'),

            const SizedBox(
              height: 20,
            ),
            Text(
              'Login',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Good to see you back! 💙',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            // Email Input
            InputWidget(
              ctrl: emailController,
              label: "E-mail",
              isPass: false,
            ),

            const SizedBox(
              height: 20,
            ),

            // Password Input
            InputWidget(
              ctrl: passwordController,
              label: '*********',
              isPass: true,
            ),

            // Access Button
            GestureDetector(
              onTap: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Center(
                        child: Text(
                            'Favor preencher os campos de E-mail e senha.'),
                      ),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 20.0),
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: AppColors.primaryColor,
                ),
                child: const Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
