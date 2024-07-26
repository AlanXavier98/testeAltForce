import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/controllers/order_controller.dart';
import 'package:online_store/services/order_service.dart';
import 'package:online_store/widgets/order_widgets/order_card_widget.dart';
import 'order_detail_screen.dart'; // Importa a tela de detalhes do pedido
import 'package:online_store/widgets/secondary_screen_appBar_widget.dart'; // Importa o widget de AppBar

class OrderListScreen extends StatelessWidget {
  final OrderController orderController = Get.put(OrderController(
      OrderService(Dio()))); // Instancia o controlador de pedidos

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (orderController.orders.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) {
            final order = orderController.orders[index];
            return OrderCardWidget(
              order: order,
              onTap: () {
                // Navegar para a tela de detalhes do pedido
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderDetailScreen(order: order),
                  ),
                );
              },
            );
          },
        );
      }),
    );
  }
}
