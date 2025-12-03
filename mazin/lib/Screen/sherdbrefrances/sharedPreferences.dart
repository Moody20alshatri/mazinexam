import 'package:flutter/material.dart';
import 'package:mazin/Screen/sherdbrefrances/ListSherd.dart';
import 'package:mazin/helper/sharedPreferences.dart';

class sharedPre extends StatefulWidget {
  const sharedPre({super.key});

  @override
  State<sharedPre> createState() => _sharedPreState();
}

class _sharedPreState extends State<sharedPre> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("shared Preferences", style: TextStyle(color: Colors.white),),      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                
                onSubmitted: (value) async {
                },
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    
                  ),
                  labelText: 'Enter your name',
                ),
        
              ),

              ElevatedButton(
                
                onPressed: () async{
                  await SharedPreferencesHelper.save('name', _controller.text);
              }, child: Text("إضافة",style: TextStyle(color: Colors.black,fontSize: 25),)),
               ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Listsherd(),));
              }, child: Text("عرض",style: TextStyle(color: Colors.black,fontSize: 25),))
            ],
          ),
        ),
      )
    );
  }
}