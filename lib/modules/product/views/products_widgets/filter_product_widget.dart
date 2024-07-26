import 'package:flutter/material.dart';

class FilterProductWidget extends StatelessWidget {
  final String label;
  final bool select;
  final VoidCallback onTap; // Adicione um callback para o onTap

  const FilterProductWidget({
    Key? key,
    required this.label,
    required this.select,
    required this.onTap, // Adicione o parâmetro no construtor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Chama o callback quando o widget é clicado
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: select ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: select ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
