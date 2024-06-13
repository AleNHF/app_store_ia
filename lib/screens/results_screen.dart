import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String>? results =
        ModalRoute.of(context)!.settings.arguments as List<String>?;

    return Scaffold(
      appBar: AppBar(title: const Text('Search Results')),
      body: results == null || results.isEmpty
          ? const Center(child: Text('No results found.'))
          : ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Product: ${results[index]}'),
                );
              },
            ),
    );
  }
}
