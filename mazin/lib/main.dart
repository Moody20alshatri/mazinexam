import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as Cachedata;
import 'package:mazin/Screen/Form/InputForm.dart';
import 'package:mazin/Screen/Home.dart';
import 'package:mazin/Screen/Listviewbulder/ListViewBulder.dart';
import 'package:mazin/Screen/Login.dart';
import 'package:mazin/Screen/Menu.dart';
import 'package:mazin/Screen/Profile.dart';
import 'package:mazin/Screen/To-Do_List.dart';
import 'package:mazin/Screen/bottomNavigationBar/HomepageNavi.dart';
import 'package:mazin/Screen/TextFields/one.dart';
import 'package:mazin/Screen/sherdbrefrances/sharedPreferences.dart';
import 'package:mazin/helper/sharedPreferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesHelper sharedPreferencesHelper = SharedPreferencesHelper();
  await sharedPreferencesHelper.init();
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
         '/profile': (context) => profile(),
         '/One': (context) => One(),
         '/HomepageNavi': (context) => HomepageNavi(),
         '/ListViewbulder': (context) => ListViewbulder(),
         '/FormInput': (context) => FormInput(),
         '/sharedPre': (context) => sharedPre(),
       },
      home: LoginPage()
    );
  }
}
