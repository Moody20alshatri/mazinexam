import 'package:flutter/material.dart';
import 'package:mazin/Screen/Home.dart';
import 'package:mazin/widget/Push_Pages.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('القائمة الرئيسية', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white,),
          onPressed: () {
            // Action for menu button
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Push_Pages(page: "/Rosary",icon:Icons.looks_one_rounded ,title: "المسبحة",),
                    Push_Pages(page: "/ToDoList",icon:Icons.list_alt_outlined ,title: "قائمة المهام",),
                ],
              )
             
            ],
          ),
        )
      ),
    );
  }
}

