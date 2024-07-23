import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/colors/app_colors.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () {
            Modular.to.pop();
          },
        ),
        title: Text(
          'Product Detail',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://via.placeholder.com/150',
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            SizedBox(height: 20.0),
            Text(
              'Product Name',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              '\$17.00',
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis justo mollis, auctor consequat urna.',
              style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
