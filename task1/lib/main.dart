import 'package:flutter/material.dart';
import 'package:task1/third_part.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lab 09',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ThirdPart(),
    );
  }
}