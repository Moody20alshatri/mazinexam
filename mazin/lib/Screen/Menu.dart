import 'package:flutter/material.dart';
import 'package:mazin/Screen/Home.dart';
import 'package:mazin/widget/Push_Pages.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'القائمة الرئيسية',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () {
            // Action for menu button
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Push_Pages(
                    page: "/Rosary",
                    icon: Icons.numbers_rounded,
                    title: "المسبحة",
                  ),
                  Push_Pages(
                    page: "/ToDoList",
                    icon: Icons.list_alt_outlined,
                    title: "قائمة المهام",
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Push_Pages(
                    page: "/profile",
                    icon: Icons.person_outline,
                    title: "الملف الشخصي",
                  ),

                  Push_Pages(
                    page: "/One",
                    icon: Icons.text_fields,
                    title: "Text Fiesds",
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Push_Pages(
                    page: "/HomepageNavi",
                    icon: Icons.navigation_outlined,
                    title: "NavigationBar",
                  ),
                  Push_Pages(
                    page: "/ListViewbulder",
                    icon: Icons.line_style_rounded,
                    title: "ListView Builder",
                  ),

                  
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Push_Pages(
                    page: "/FormInput",
                    icon: Icons.file_open_outlined,
                    title: "Form ",
                  ),
                  Push_Pages(
                    page: "/sharedPre",
                    icon: Icons.storage,
                    title: "Shared Preferences",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
