import 'package:flutter/material.dart';
import 'package:mazin/Screen/Menu.dart';
import 'package:mazin/Screen/Register.dart';
import 'package:mazin/helper/file.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();


  final userFile = UserFile(); // ← الكلاس الجديد

 login() async {
    final data = await userFile.readUser();

    if(data != null){
       if (_username.text.trim() == data["username"] &&
        _password.text.trim() == data["password"]) 
    {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Menu()),
      );
    } 
    }
   
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("تسجيل دخول", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _username,
              decoration: const InputDecoration(
                hintText: "اسم المستخدم",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _password,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "كلمة المرور",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: const Text(
                'إنشاء حساب',
                style: TextStyle(color: Colors.indigo),
              ),
            ),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: login,
              child: Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.indigo.withOpacity(0.4),
                      blurRadius: 6,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: const Text(
                  "تسجيل الدخول",
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
