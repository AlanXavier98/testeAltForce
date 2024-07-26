import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/controllers/product_controller.dart';
import 'package:online_store/controllers/cart_controller.dart';
import 'package:online_store/services/product_service.dart';
import 'package:online_store/views/order_screens/order_list_screen.dart';
import 'package:online_store/views/product_screens/cart_screen.dart';
import 'package:online_store/widgets/products_widgets/category_filters_widgets.dart';
import 'package:online_store/widgets/products_widgets/grid_product_widget.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final ProductController controller =
      Get.put(ProductController(ProductService(Dio())));
  final CartController cartController = Get.put(CartController());
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    ProductListScreen(),
    OrderListScreen(),
    CartScreen(),
    Container(), // Perfil
  ];

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Produtos';
      case 1:
        return 'Pedidos';
      case 2:
        return 'Carrinho';
      case 3:
        return 'Perfil';
      default:
        return 'Shop';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _getAppBarTitle(),
          style: TextStyle(color: AppColors.primaryColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final ProductController controller = Get.find();
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CategoryFilters(),
          SizedBox(height: 15),
          Obx(() {
            if (controller.filteredProducts.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }
            return ProductGrid(products: controller.filteredProducts);
          }),
        ],
      ),
    );
  }
}
