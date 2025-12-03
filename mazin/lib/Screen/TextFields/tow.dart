import 'package:flutter/material.dart';

class Tow extends StatelessWidget {
  const Tow({super.key, required this.PassValue});
 final String PassValue ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Text Fields", style: TextStyle(color: Colors.white),),      ),
      body: Center(
        child: Text(PassValue, style: TextStyle(fontSize: 24, color: Colors.indigo)),
      ),
    );
  }
}