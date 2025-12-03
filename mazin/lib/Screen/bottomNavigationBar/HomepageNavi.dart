import 'package:flutter/material.dart';
import 'package:mazin/Screen/bottomNavigationBar/Homepage.dart';
import 'package:mazin/Screen/bottomNavigationBar/Serch.dart';
import 'package:mazin/Screen/bottomNavigationBar/Setitng.dart';
import 'package:mazin/Screen/bottomNavigationBar/checkBox.dart';

class HomepageNavi extends StatefulWidget {
  const HomepageNavi({super.key});

  @override
  State<HomepageNavi> createState() => _HomepageNaviState();
}

class _HomepageNaviState extends State<HomepageNavi> {
  // variable
  int _currentIndex = 0;
  // list of pages
  List<Widget> pages = [
    Homepage(),
    SerachPage(),
    SetitngPage(),
    CheckboxPage()
  ];

  // function to Title
  String setTitle(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Search";
      case 2:
        return "Settings";
      case 3:
        return "Checkbox";
      default:
        return "";
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(setTitle(_currentIndex),style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ), 
      body:
         IndexedStack(
          index: _currentIndex,
          children: pages,
         ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.indigo,
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(size: 30),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: "Check Box"),
        ],
      ),
    );
  }
}