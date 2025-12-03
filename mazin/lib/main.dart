import 'package:flutter/material.dart';
import 'package:mazin/Screen/Home.dart';
import 'package:mazin/Screen/Login.dart';
import 'package:mazin/Screen/Menu.dart';
import 'package:mazin/Screen/To-Do_List.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      initialRoute: '/',
       routes: {
         '/Rosary': (context) => Rosary(), 
         '/ToDoList': (context) => ToDoList(),
       },
      home: LoginPage()
    );
  }
}
