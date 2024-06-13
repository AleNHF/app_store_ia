// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:app_store_ia/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProcessingScreen extends StatefulWidget {
  final String imageUrl;

  const ProcessingScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  _ProcessingScreenState createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  late Future<List<Product>> _fetchSimilarProducts;

  @override
  void initState() {
    super.initState();
    _fetchSimilarProducts = _processImage(widget.imageUrl);
  }

  Future<List<Product>> _processImage(String imageUrl) async {
    final uri = Uri.parse('https://e6ea-177-222-36-39.ngrok-free.app/api/google-cloud');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'image': imageUrl}),
    );

    if (response.statusCode == 201) {
      final jsonResponse = jsonDecode(response.body) as List<dynamic>;
      return jsonResponse.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load similar products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos similares'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: FutureBuilder<List<Product>>(
        future: _fetchSimilarProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network('https://img.pikbest.com/png-images/20190918/cartoon-snail-loading-loading-gif-animation_2734139.png!bw700'), // Asegúrate de tener este archivo en tu carpeta assets
                  const SizedBox(height: 20),
                  const Text(
                    'Buscando productos similares...',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  const SizedBox(height: 10),
                  Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No se encontraron productos similares',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            );
          } else {
            List<Product> products = snapshot.data!;
            return GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image.network(
                            products[index].image,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products[index].name,
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Bs ${products[index].price.toStringAsFixed(2)}',
                              style: const TextStyle(color: Colors.teal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
