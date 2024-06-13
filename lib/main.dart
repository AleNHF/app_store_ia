import 'package:app_store_ia/screens/image_upload_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fashion Search App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const ImageUploadScreen(),
        //'/processing': (context) => const ProcessingScreen(),
        //'/results': (context) => const ResultsScreen(),
      },
    );
  }
}