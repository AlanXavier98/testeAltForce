import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Importa o pacote intl para formatação de moeda

class FormattedOrderValue extends StatelessWidget {
  final double value;

  FormattedOrderValue({required this.value});

  // Método para formatar o valor como moeda brasileira
  String _formatCurrency(double value) {
    return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$')
        .format(value); // Formata o valor
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Valor Total: ${_formatCurrency(value)}',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
