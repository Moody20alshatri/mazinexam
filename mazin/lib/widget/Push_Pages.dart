import 'package:flutter/material.dart';

class Push_Pages extends StatelessWidget {
  const Push_Pages({required this.page, required this.title, required this.icon, super.key});
  final String page;
  final String title ;
  final IconData icon ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, page);
      },
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Icon(
              icon,
              size: 50,
              color: Colors.blue,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
