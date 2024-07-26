import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:online_store/modules/profile/controllers/profile_controller.dart';
import 'package:online_store/widgets/secondary_screen_appBar_widget.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ProfileController profileController = Get.find();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializando os controladores de texto com os valores atuais do perfil
    final profile = profileController.userProfile.value;
    _nameController.text = profile.name;
    _emailController.text = profile.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryScreenAppBarWidget(title: 'Editar Perfil'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar as alterações do perfil
                final updatedProfile =
                    profileController.userProfile.value.copyWith(
                  name: _nameController.text,
                  email: _emailController.text,
                );
                profileController.updateProfile(updatedProfile);
                Modular.to.pop(); // Voltar para a tela de perfil
              },
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
