import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/modules/main/controllers/main_controller.dart';
import 'package:online_store/modules/order/views/order_list_screen.dart';
import 'package:online_store/modules/product/views/cart_screen.dart';
import 'package:online_store/modules/profile/views/profile_screen.dart';
import 'package:online_store/modules/product/views/product_list_screen.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  final MainController mainController = Get.put(MainController());

  final List<Widget> pages = [
    ProductListScreen(),
    OrderListScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(
              mainController.getAppBarTitle(),
              style: TextStyle(color: AppColors.primaryColor),
            )),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: Obx(() => IndexedStack(
            index: mainController.selectedIndex.value,
            children: pages,
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: 'Pedidos',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Carrinho',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            currentIndex: mainController.selectedIndex.value,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            onTap: mainController.onItemTapped,
          )),
    );
  }
}
