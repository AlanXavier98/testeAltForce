import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:online_store/widgets/secondary_screen_appBar_widget.dart';
import 'dart:io';

class ChangeProfilePictureScreen extends StatefulWidget {
  @override
  _ChangeProfilePictureScreenState createState() =>
      _ChangeProfilePictureScreenState();
}

class _ChangeProfilePictureScreenState
    extends State<ChangeProfilePictureScreen> {
  File? _selectedImage;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryScreenAppBarWidget(title: 'Alterar Foto de Perfil'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[200],
                ),
                child: _selectedImage != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(_selectedImage!),
                      )
                    : Icon(
                        Icons.camera_alt,
                        size: 50,
                        color: Colors.grey[600],
                      ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Lógica para salvar a foto de perfil
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
