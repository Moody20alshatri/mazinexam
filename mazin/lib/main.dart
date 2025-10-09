import 'package:flutter/material.dart';
import 'package:mazin/Screen/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false ,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('المسبحة الإلكترونية', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu,color: Colors.white,),
            onPressed: () {
              // Handle menu button press
            },
          ),
        ),
        body:  Column(
          children:[
            const SizedBox(height: 30),
            HomeScreen(title: 'سـبـحـــان الـلــه', color: Colors.blue[50]!),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            HomeScreen(title: 'الحــمــد لــلــه ', color: Colors.green[50]!),
             Container(
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            HomeScreen(title: 'الــلــه أكــبــر', color: Colors.pink[50]!),
             Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ] 
        ),
      ),
    );
  }
}
