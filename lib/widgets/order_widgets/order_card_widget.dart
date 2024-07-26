import 'package:flutter/material.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/models/order_model.dart';
import 'package:online_store/widgets/formatted_order_date_widget.dart';

class OrderCardWidget extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  OrderCardWidget({required this.order, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            // Usando Row para organizar o conteúdo
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Espaça o conteúdo
            children: [
              Expanded(
                // Permite que o texto ocupe o espaço disponível
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.name,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    FormattedOrderDate(
                        date: order.deliveryDate), // Usando o widget de data
                    SizedBox(height: 10.0),
                    Text(
                      'Status: ${order.status}',
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward,
                  color: AppColors.primaryColor), // Ícone à direita
            ],
          ),
        ),
      ),
    );
  }
}
