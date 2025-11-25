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
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  String? msg;
  bool _obscure = true;

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

    if (_userCtrl.text.trim() == saved["username"] &&
        _passCtrl.text.trim() == saved["password"]) {
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
        title: const Text("تسجيل دخول"),
        backgroundColor: const Color(0xFF002F2C),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
        mainAxisAlignment : MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userCtrl,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "اسم المستخدم",
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _passCtrl,
              obscureText: _obscure,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "كلمة المرور",
                suffixIcon: IconButton(
                  icon:
                      Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() => _obscure = !_obscure);
                  },
                ),
              ),
            ),

            if (msg != null) ...[
              const SizedBox(height: 12),
              Text(
                msg!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
              TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  RegisterPage()),
              );
              }, child: Text('تسجيل الدخول')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              child: const Text("دخول"),
            ),
          ],
        ),
      ),
    );
  }
}
