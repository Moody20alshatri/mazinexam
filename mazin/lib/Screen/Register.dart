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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("إنشاء حساب", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            TextField(
              controller: _usernameCtrl,
              decoration: const InputDecoration(
                filled: true,
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
              controller: _passwordCtrl,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: "كلمة المرور",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2,
                  )
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                     Icons.visibility,
                  ),
                  onPressed: () {
                   
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
               GestureDetector(
              onTap: register,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 50  ,
                    child:  Center(child: Text("إنشاء حساب ",style: TextStyle(color: Colors.white,fontSize: 22),)),
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

