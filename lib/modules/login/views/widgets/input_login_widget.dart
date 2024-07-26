import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_store/colors/app_colors.dart';

class InputWidget extends StatefulWidget {
  // label é o texto que vai se mostrado no input antes de digitar algo
  var label;
  // ctrl é a controladora que o input vai ganhar para ela, cada uma tem o seu controller
  var ctrl;
  // isPass é para verificar se o input é para a senha ou não, se for ele é alterado para input de senha
  var isPass;

  InputWidget(
      {@required this.ctrl, @required this.label, @required this.isPass});

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Color.fromARGB(248, 248, 248, 248)),
      margin: EdgeInsets.only(bottom: 15.0),
      child: TextFormField(
        obscureText: widget.isPass ? obscureText : false,
        controller: widget.ctrl,
        onChanged: (value) {
          widget.ctrl.text = value;
        },
        style: TextStyle(color: AppColors.textColorSecondary),
        decoration: InputDecoration(
          hintText: widget.label,
          hintStyle: TextStyle(color: AppColors.textColorSecondary),
          suffixIcon: widget.isPass
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: Icon(
                    obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                )
              : Container(
                  child: Text(''),
                ),
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
        keyboardType:
            widget.isPass ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
