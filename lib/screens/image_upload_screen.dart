// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

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
        title: const Text('Upload Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _imageFile != null
                ? Image.file(File(_imageFile!.path))
                : const Text('No image selected'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.gallery),
              child: const Text('Select from Gallery'),
            ),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.camera),
              child: const Text('Take a Photo'),
            ),
          ],
        ),
      ),
    );
  }
}
