// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'processing_screen.dart'; // Importa la pantalla de procesamiento

class ImageUploadScreen extends StatefulWidget {
  const ImageUploadScreen({Key? key}) : super(key: key);

  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  XFile? _imageFile;
  final picker = ImagePicker();

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
      await _uploadImage(pickedFile);
    }
  }

  Future<void> _uploadImage(XFile image) async {
    final bytes = await image.readAsBytes();
    String base64Image = base64Encode(bytes);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProcessingScreen(imageUrl: base64Image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Búsqueda visual'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /* Image.network(
                'https://img.freepik.com/vector-premium/plantilla-logotipo-negocio-diseno-moda_278222-6747.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1706918400&semt=ais', // Imagen del logo de la tienda
                width: 120,
                height: 120,
              ), 
              const SizedBox(height: 16),*/
              const Text(
                'Encuentra tu estilo',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              _imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(_imageFile!.path),
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Image.network(
                      'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png', // Imagen de marcador de posición
                      width: 200,
                      height: 200,
                    ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => _getImage(ImageSource.gallery),
                icon: const Icon(Icons.photo),
                label: const Text('Seleccionar de la Galería'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _getImage(ImageSource.camera),
                icon: const Icon(Icons.camera_alt),
                label: const Text('Tomar una Foto'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
