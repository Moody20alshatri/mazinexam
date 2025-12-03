import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الملف الشخصي",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: ProfileInfo(),
              ),
              Divider(color: Colors.blueGrey),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.email, color: Colors.indigo),
                    SizedBox(width: 8),
                    Text(
                      "Email:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "Eng.Mohammed.AlShatri@gmail.com",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.phone, color: Colors.indigo),
                    SizedBox(width: 8),
                    Text(
                      "Phone:",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "+967 775 474 959",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
      
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.indigo),
                    SizedBox(width: 8),
                    Text(
                      "Location:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Tream - YEMEN",
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
      
              SizedBox(height: 12),
              Divider(color: Colors.blueGrey[100]),
              SizedBox(height: 12),
              SectionTitle(title: "المهارات"),
              Skills(name: "العمل الجماعي والتعاون الفعّال"),
              Skills(name: "حل المشكلات والتفكير التحليلي"),
              Skills(name: "تحمل ضغط العمل"),
      
              SectionTitle(title: "الخبرات العلمية "),
      
              Skills(name: "بكالوريوس تقنية المعلومات  - جامعة سيئون"),
              Skills(name: "دورة تطوير تطبيقات Flutter -  ثروت سامي"),
              Skills(name: "دورة تطوير واجهات ASP.NET Core - محمد الهلالي"),
              Skills(name: "دورة قواعد البيانات Oracle و SQL Server"),
              SizedBox(height: 8),
              SectionTitle(title: "الخبرات العملية"),
      
              Skills(name: "تطوير تطبيقات ويب باستخدام ASP.NET Core MVC و Razor Pages",),
              Skills(name: "بناء تطبيق Flutter متعدد الواجهات للهواتف"),
              Skills(name: "تطوير نظام محاسبي كامل باستخدام Entity Framework و SQL Server",),
              Skills(name: "تصميم واجهات مستخدم متقدمة UI/UX باستخدام Flutter و Bootstrap",),
            ],
          ),
        ),
      ),
    );
  }
}


class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white, 
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.indigo.shade200, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.indigo.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.indigo,
            child: CircleAvatar(
              backgroundImage: const AssetImage(
                "assets/wallpaperflare.com_wallpaper.jpg",
              ),
              radius: 55,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Mohammed Al-shatri",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Back End Developer",
            style: TextStyle(
              fontSize: 16,
              color: Colors.indigo.shade700,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 1,
            width: 100,
            color: Colors.indigo.shade200,
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.indigo[100],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            // const Divider(thickness: 2),
            const SizedBox(height: 6),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 6),
            // const Divider(thickness: 2),
          ],
        ),
      ),
    );
  }
}

class Skills extends StatelessWidget {
  const Skills({required this.name});
  final name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: Container(
        child: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.indigo, size: 18),
            SizedBox(width: 8),
            Expanded(child: Text(name, style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
