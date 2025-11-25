import 'dart:io';
import 'package:mazin/Screen/Login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  bool _obscure = true;
  String? msg;

  Future<File> _getFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/user.txt");
  }

  Future<void> register() async {
    if (_usernameCtrl.text.isEmpty || _passwordCtrl.text.isEmpty) {
      setState(() {
        msg = "الرجاء تعبئة جميع الحقول";
      });
      return;
    }

    final file = await _getFile();

    await file.writeAsString(
      "username=${_usernameCtrl.text.trim()}\npassword=${_passwordCtrl.text.trim()}",
    );

    setState(() {
      msg = "تم الحفظ داخل ملف user.txt";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF002F2C),
      appBar: AppBar(
        title: const Text("إنشاء حساب"),
        backgroundColor: const Color(0xFF002F2C),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            TextField(
              controller: _usernameCtrl,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "اسم المستخدم",
              ),
            ),
            const SizedBox(height: 12),

            TextField(
              controller: _passwordCtrl,
              obscureText: _obscure,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "كلمة المرور",
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscure = !_obscure;
                    });
                  },
                ),
              ),
            ),

            if (msg != null) ...[
              const SizedBox(height: 12),
              Text(
                msg!,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],

            const SizedBox(height: 20),
            TextButton(onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  LoginPage()),
              );
              }, child: Text('تسجيل الدخول')),
            ElevatedButton(
              onPressed: register,
              child: const Text("تسجيل"),
            ),
          ],
        ),
      ),
    );
  }
}

