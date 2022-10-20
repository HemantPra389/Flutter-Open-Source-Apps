import 'package:flutter/material.dart';
import 'speech.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Speech Detector',
      theme: ThemeData.fallback(),
      home: SpeechConverter(),
    );
  }
}
