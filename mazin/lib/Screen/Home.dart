import 'package:flutter/material.dart';

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
                    color: Colors.blue[900]),
              ),
              
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
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
