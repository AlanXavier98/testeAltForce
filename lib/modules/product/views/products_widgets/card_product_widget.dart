import 'package:flutter/material.dart';
import 'package:online_store/modules/product/services/product_model.dart';
import 'package:online_store/modules/product/views/product_detail_screen.dart';
import 'package:online_store/widgets/button_padrao_widget.dart';

class CardProductWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onRemove; // Adiciona um callback para remoção

  const CardProductWidget({super.key, required this.product, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9, // Proporção da imagem
              child: Image.network(
                product.images.isNotEmpty
                    ? product.images[0]
                    : '', // Verifica se há imagens
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  // Imagem padrão em caso de erro
                  return Image.asset(
                    'lib/assets/images/placeholder.jpg', // Caminho para a imagem de placeholder
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                    maxLines: 1, // Limita a 1 linha
                    overflow: TextOverflow.ellipsis, // Adiciona reticências
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                    maxLines: 2, // Limita a 2 linhas
                    overflow: TextOverflow.ellipsis, // Adiciona reticências
                  ),
                  SizedBox(height: 4.0), // Espaçamento menor para o preço
                  Text(
                    'R\$ ${product.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  if (onRemove != null)
                    ButtonPadraoWidget(
                      label: 'Remover do Carrinho',
                      func: () {
                        onRemove!();
                      },
                    ),

                  // TextButton(
                  //   onPressed: onRemove,
                  //   child: Text(
                  //     'Remover do Carrinho',
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
