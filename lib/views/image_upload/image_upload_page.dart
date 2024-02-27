import 'dart:io';
import 'package:estudos/components/footer.dart';
import 'package:estudos/components/header.dart';
import 'package:estudos/models/forms/utils_names/router_names_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploadPage extends StatefulWidget {
  @override
  _ImageUploadPageState createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  File? _image;

  Future pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SafeArea(
              child: Padding(
                padding: EdgeInsets.zero,
                child: Header(title: 'Imagem Upload',
                onBack: () => Navigator.pop(context),
                onAvatarTap: () => Navigator.pushNamed(context, routePaths[RouteNames.profile]!),
                ),
              ),
            ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _image != null ? Image.file(_image!) : const Text('Nenhuma imagem selecionada'),
                  ElevatedButton(
                    onPressed: () => pickImage(ImageSource.gallery),
                    child: const Text('Selecionar da Galeria'),
                  ),
                  ElevatedButton(
                    onPressed: () => pickImage(ImageSource.camera),
                    child: const Text('Tirar uma Foto'),
                  ),
                ],
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
