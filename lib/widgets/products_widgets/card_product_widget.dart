import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:online_store/colors/app_colors.dart';

class CardProductWidget extends StatefulWidget {
  const CardProductWidget({super.key});

  @override
  State<CardProductWidget> createState() => _CardProductWidgetState();
}

class _CardProductWidgetState extends State<CardProductWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed('/productDetail');
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Image.network(
                'https://via.placeholder.com/150',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    'Lorem ipsum dolor sit amet',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    '\$17.00',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
