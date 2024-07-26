import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/colors/app_colors.dart'; // Importa a função de navegação segura

class SecondaryScreenAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  SecondaryScreenAppBarWidget({Key? key, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
        onPressed: () {
          Modular.to.pop();
        },
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColors.primaryColor),
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: AppColors.primaryColor),
    );
  }
}
