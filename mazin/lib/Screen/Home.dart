import 'package:flutter/material.dart';

class Rosary extends StatelessWidget {
  const Rosary({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('المسبحة الإلكترونية', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: Colors.indigo,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu,color: Colors.white,),
            onPressed: () {
            },
          ),
        ),
        body:  Column(
          children:[
            const SizedBox(height: 30),
            HomeScreen(title: 'سـبـحـــان الـلــه', color: Colors.indigo[50]!),
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            HomeScreen(title: 'الحــمــد لــلــه ', color: Colors.green[50]!),
             Container(
              height: 1,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 10),
            HomeScreen(title: 'الــلــه أكــبــر', color: Colors.pink[50]!),
             Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ] 
        ),
      );
  }
}


class HomeScreen extends StatelessWidget {
   String title = ' الـلــه';
   Color color ;
   HomeScreen({required this.title , required this.color});
  @override
  Widget build(BuildContext context) {
    return 
    MyCounter(title: title, color: color, initialCount: 0);
  }
}

class MyCounter extends StatefulWidget {
  final String title;
  final Color color;
  final int initialCount;

  const MyCounter({
    super.key,
    required this.title,
    required this.color,
    required this.initialCount,
  });

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.initialCount; // نحفظ القيمة الابتدائية هنا
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          widget.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: -2,
                blurRadius: 7,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$count',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo[900]),
              ),
              
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(8),
                ),
                child:Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.restart_alt, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          if (count > 0) {
                            count = 0;
                          }
                        });
                      },
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.white,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {
                        setState(() {
                          count++;
                        });
                      },
                    ),
                  ],
                ),
              
            ),
            ])
          ,
        ),
      ],
    );
  }
}
