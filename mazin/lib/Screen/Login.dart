import 'dart:io';
import 'package:mazin/Screen/Home.dart';
import 'package:mazin/Screen/Register.dart';
import 'package:mazin/main.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _passowrd = TextEditingController();

  String? msg;

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/user.txt");
  }

  Future<Map<String, String>> readUserData() async {
    final file = await _getFile();

    if (!await file.exists()) return {};

    final text = await file.readAsString();

    final lines = text.split("\n");

    String username = "";
    String password = "";

    for (var line in lines) {
      if (line.startsWith("username=")) {
        username = line.replaceFirst("username=", "").trim();
      } else if (line.startsWith("password=")) {
        password = line.replaceFirst("password=", "").trim();
      }
    }

    return {"username": username, "password": password};
  }

  Future<void> login() async {
    final saved = await readUserData();

    if (saved.isEmpty) {
      setState(() {
        msg = "لا يوجد حساب مسجل!";
      });
      return;
    }

    if (_username.text.trim() == saved["username"] &&
        _passowrd.text.trim() == saved["password"]) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Rosary()),
      );
    } else {
      setState(() {
        msg = "اسم المستخدم أو كلمة المرور خاطئة!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("تسجيل دخول", style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
        mainAxisAlignment : MainAxisAlignment.center,
          children: [
            TextField(
              controller: _username,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                hintText: "اسم المستخدم",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  )
                ),
              ),
              
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _passowrd,
              decoration: InputDecoration(

                hintText: "كلمة المرور",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  )
                ),
                suffixIcon: IconButton(
                  icon:
                      Icon(Icons.password, color: Colors.blue,),
                  onPressed: () {
                  },
                ),
              ),
            ),

              TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  RegisterPage()),
              );
              }, child: Text(' إنشاء حساب', style: TextStyle(color: Colors.blue),)),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: login,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 50  ,
                    child:  Center(child: Text(" تسجيل الدخول",style: TextStyle(color: Colors.white,fontSize: 22),)),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                ),
              
            )
              
            
          ],
        ),
      ),
    );
  }
}
