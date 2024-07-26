import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart'; // Importa o pacote de estrelas
import 'package:online_store/colors/app_colors.dart';
import 'package:online_store/widgets/button_padrao_widget.dart'; // Importa o botão personalizado
import 'package:online_store/widgets/secondary_screen_appBar_widget.dart'; // Importa o widget de AppBar

class OrderReviewScreen extends StatefulWidget {
  OrderReviewScreen();

  @override
  _OrderReviewScreenState createState() => _OrderReviewScreenState();
}

class _OrderReviewScreenState extends State<OrderReviewScreen> {
  double _rating = 0.0; // Avaliação inicial
  final TextEditingController _commentController =
      TextEditingController(); // Controlador para o campo de comentário

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryScreenAppBarWidget(
        title: 'Avaliar Pedido',
      ), // Usando o widget de AppBar
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza os widgets
            children: [
              SizedBox(height: 10.0),
              Text(
                'Avalie seu pedido:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10.0),
              Center(
                child: RatingBar.builder(
                  initialRating: _rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 40.0,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.primaryColor,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _rating = rating; // Atualiza a avaliação
                    });
                  },
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Sua avaliação: $_rating',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  labelText: 'Deixe um comentário',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3, // Permite múltiplas linhas
              ),
              SizedBox(height: 20.0),
              Center(
                child: ButtonPadraoWidget(
                  label: 'Enviar Avaliação',
                  func: () {
                    // Lógica para enviar a avaliação
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Avaliação enviada com sucesso!')),
                    );
                    // Voltar para a tela de detalhes do pedido
                    Modular.to.navigate('/orders');
                    //Navigator.pop(context);
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
