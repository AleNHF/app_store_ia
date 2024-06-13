// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:app_store_ia/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

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
    final uri = Uri.parse('https://5280-177-222-36-39.ngrok-free.app/api/google-cloud');
    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'image': imageUrl}),
    );
    print('response: ${response.body}');
    print('response status code: ${response.statusCode}');

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
        title: const Text('Processing Image'),
      ),
      body: FutureBuilder<List<Product>>(
        future: _fetchSimilarProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No similar products found'),
            );
          } else {
            List<Product> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(products[index].image),
                  title: Text(products[index].name),
                  subtitle: Text('\$ ${products[index].price.toStringAsFixed(2)}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}
