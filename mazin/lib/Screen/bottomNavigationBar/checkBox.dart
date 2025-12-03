import 'package:flutter/material.dart';

class CheckboxPage extends StatelessWidget {
  const CheckboxPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: Colors.white, 
   body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.check_box,
          size: 120,
          color: Colors.indigo,
        ),
        const SizedBox(height: 20),
        const Text(
          "Welcome!",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "This is your Check Box Page",
          style: TextStyle(
            fontSize: 18,
            color: Colors.indigo,
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () {},
          child: const Text(
            "Get Started",
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    ),
  ),
);

  }
}