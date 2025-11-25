import 'package:flutter/material.dart';
import 'package:mazin/Screen/Home.dart';
import 'package:mazin/Screen/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: LoginPage()
    );
  }
}
