import 'package:flutter/material.dart';
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primaryColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Detalhes do Produto',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  product.images.isNotEmpty ? product.images[0] : '',
                  fit: BoxFit.cover,
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    return Image.asset(
                      'lib/assets/images/placeholder.jpg',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                product.name,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                'R\$ ${product.price.toStringAsFixed(2)}',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
              const SizedBox(height: 20.0),
              Text(
                product.description,
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 20.0),
              Text(
                'Categoria: ${product.category}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 10.0),
              Text(
                'Avaliação: ${product.rating!.toStringAsFixed(1)}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
              SizedBox(height: 10.0),
              Text(
                'Estoque: ${product.stock}',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
