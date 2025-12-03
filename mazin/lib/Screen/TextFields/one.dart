import 'package:flutter/material.dart';
import 'package:mazin/Screen/TextFields/tow.dart';

class One extends StatefulWidget {
  const One({super.key});
  
  @override
  State<One> createState() => _OneState();
}
 final TextEditingController Controller1 = TextEditingController();
 final TextEditingController Controller2 = TextEditingController();

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Text Fields", style: TextStyle(color: Colors.white),),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              SizedBox(height: 150,),
              TextField(
                controller: Controller1,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      style: BorderStyle.solid,
                      // strokeAlign: BorderSide.strokeAlignCenter,
                    )
                  )
                ),
              ),
              SizedBox(height: 50,),
              TextField(
                controller: Controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    borderSide: BorderSide(
                      color: Colors.indigo,
                      style: BorderStyle.solid,
                      // strokeAlign: BorderSide.strokeAlignCenter,
                    )
                  )
                ),
              ),
              GestureDetector(
                onTap: (){
                  Controller2.text = Controller1.text;
                },
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Center(
                    child: Text("ارسال القيمة الى textfield",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
              // SizedBox(height: ,),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Tow(PassValue: Controller1.text)));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.indigo,width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Center(
                    child: Text("ارسال القيمة الى الصفحة التالية",style: TextStyle(color: Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}