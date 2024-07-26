import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/modules/order/services/order_model.dart';
import 'package:online_store/widgets/formatted_order_date_widget.dart';
import 'package:online_store/widgets/formatted_order_value_widget.dart';
import 'package:online_store/modules/product/views/products_widgets/card_product_widget.dart';
import 'package:online_store/widgets/button_padrao_widget.dart';
import 'package:online_store/widgets/secondary_screen_appBar_widget.dart';

class OrderDetailScreen extends StatelessWidget {
  final Order order;

  OrderDetailScreen({required this.order});

  // Método para calcular o valor total do pedido
  double _calculateTotal() {
    double total = 0.0;
    for (var product in order.products) {
      total += product.price; // Soma o preço de cada produto
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryScreenAppBarWidget(
        title: 'Detalhes do Pedido',
      ), // Usando o widget de AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Número do Pedido: ${order.id}',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              FormattedOrderDate(date: order.orderDate),
              SizedBox(height: 10.0),
              FormattedOrderDate(date: order.deliveryDate),
              SizedBox(height: 10.0),
              FormattedOrderValue(value: _calculateTotal()),
              SizedBox(height: 20.0),
              Text(
                'Produtos do Pedido:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: order.products.length,
                itemBuilder: (context, index) {
                  final product = order.products[index];
                  return CardProductWidget(product: product);
                },
              ),
              SizedBox(height: 20.0),
              if (order.status == "Entregue")
                Center(
                  child: ButtonPadraoWidget(
                    label: 'Avaliar Pedido',
                    func: () {
                      Modular.to.navigate(
                          '/rateOrder'); // Navegar para a tela de avaliação
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
