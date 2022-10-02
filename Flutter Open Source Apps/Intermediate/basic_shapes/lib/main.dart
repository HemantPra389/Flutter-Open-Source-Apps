import 'package:basic_shapes/views/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Basic Shapes',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
