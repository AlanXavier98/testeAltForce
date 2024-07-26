import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:online_store/modules/profile/controllers/profile_controller.dart';
import 'package:online_store/modules/profile/services/user_model.dart';
import 'package:online_store/widgets/secondary_screen_appBar_widget.dart';

class CreateProfileScreen extends StatefulWidget {
  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final ProfileController profileController = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryScreenAppBarWidget(title: 'Cadastrar Perfil'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'Nome', border: OutlineInputBorder()),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _ageController,
                decoration: InputDecoration(
                    labelText: 'Idade', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Email', border: OutlineInputBorder()),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                    labelText: 'Endereço', border: OutlineInputBorder()),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                    labelText: 'Número do Cartão',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                    labelText: 'Data de Validade (MM/AA)',
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _cvvController,
                decoration: InputDecoration(
                    labelText: 'CVV', border: OutlineInputBorder()),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Salvar as informações do perfil
                  profileController.updateProfile(UserModel(
                    name: _nameController.text,
                    age: int.parse(_ageController.text),
                    email: _emailController.text,
                    address: _addressController.text,
                    cardNumber: _cardNumberController.text,
                    cardExpiry: _expiryDateController.text,
                    cardCVV: _cvvController.text,
                    hasCreditCard: true,
                  ));
                  if (mounted) {
                    Modular.to.pop();
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
