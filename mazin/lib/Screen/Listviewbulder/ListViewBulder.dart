import 'package:flutter/material.dart';
import 'package:mazin/Models/Userinfo.dart';
import 'package:mazin/Screen/Listviewbulder/InfoDetils.dart';


class ListViewbulder extends StatelessWidget {
  ListViewbulder({super.key});
  final List<Userinfo> _list = [
    Userinfo(name: "Mohammed", description: "Devloper program", image: "assets/Headphones.webp"),
    Userinfo(name: "Ahmed", description: "Devloper program", image: "assets/laptopwebp.webp"),
    Userinfo(name: "Omaer", description: "Devloper program", image: "assets/Router.webp"),
    Userinfo(name: "Mohammed", description: "Devloper program", image: "assets/Smart.webp"),
    Userinfo(name: "Mohammed", description: "Devloper program", image: "assets/Smartphone.webp"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("ListView Builder", style: TextStyle(color: Colors.white)),
        centerTitle: true,),
      body: Container(
        padding: const EdgeInsets.all(10),
        color: Colors.white,
        width: double.infinity,
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfoDetils(userinfo: Userinfo(name: _list[index].name, description: _list[index].description, image: _list[index].image));
                  },));
                },
                child: Card(
                  shadowColor: Colors.blue,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadiusGeometry.only(
                      bottomRight: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListTile(
                    textColor: Colors.blue,
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.indigo,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(_list[index].image),
                      ),
                    ),
                    title: Text(
                      _list[index].name,
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(_list[index].description),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
