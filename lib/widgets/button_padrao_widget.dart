import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/colors/app_colors.dart';

class ButtonPadraoWidget extends StatefulWidget {
  // label é o texto que vai ser mostrado no botão
  final String label;
  // func é a função que será executada ao clicar no botão
  final VoidCallback func;

  ButtonPadraoWidget({
    required this.func,
    required this.label,
  });

  @override
  State<ButtonPadraoWidget> createState() => _ButtonPadraoWidgetState();
}

class _ButtonPadraoWidgetState extends State<ButtonPadraoWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.func();
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20.0),
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            widget.label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
