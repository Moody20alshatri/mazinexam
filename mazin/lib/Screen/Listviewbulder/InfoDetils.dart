import 'package:flutter/material.dart';
import 'package:mazin/Models/Userinfo.dart';

class InfoDetils extends StatelessWidget {
   InfoDetils({ required this.userinfo, super.key});
  final Userinfo userinfo;
  final TextEditingController textfild = TextEditingController();
  // final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Info Detils", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(16.0),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
                backgroundColor: Colors.indigo,
              child: CircleAvatar(
                radius: 75,
              backgroundImage: AssetImage(userinfo.image),
              ),
            ),
            SizedBox(height: 20),
            Text(
              userinfo.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                userinfo.description,
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
              ),
        ),
      ));
  }
}
