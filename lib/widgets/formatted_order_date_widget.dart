import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa o pacote intl para formatação de datas

class FormattedOrderDate extends StatelessWidget {
  final String date;

  FormattedOrderDate({required this.date});

  // Método para formatar a data no formato brasileiro
  String _formatDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    return DateFormat('dd/MM/yyyy').format(parsedDate); // Formata a data
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Data do Pedido: ${_formatDate(date)}',
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}
