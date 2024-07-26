import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:online_store/modules/profile/controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          final profile = profileController.userProfile.value;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informações do Usuário',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(height: 20.0),
              if (profile.name.isNotEmpty) ...[
                Text('Nome: ${profile.name}'),
                Text('Idade: ${profile.age}'),
                Text('Email: ${profile.email}'),
                Text('Endereço: ${profile.address}'),
                if (profile.photoUrl != null) ...[
                  // Exibir a foto de perfil se disponível
                  Image.network(profile.photoUrl!),
                ],
                if (profile.hasCreditCard) ...[
                  Text('Cartão de Crédito: ${profile.cardNumber}'),
                ],
                ElevatedButton(
                  onPressed: () {
                    Modular.to.navigate('/editProfile');
                  },
                  child: Text('Editar Perfil',
                      style: TextStyle(color: Colors.white)),
                ),
              ] else ...[
                ElevatedButton(
                  onPressed: () {
                    Modular.to.navigate('/createProfile');
                  },
                  child: Text('Cadastrar Perfil',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
              SizedBox(height: 20.0),
              Text(
                'Cupons de Desconto',
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              // Aqui você pode listar os cupons disponíveis
            ],
          );
        }),
      ),
    );
  }
}
