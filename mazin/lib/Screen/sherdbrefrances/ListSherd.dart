import 'package:flutter/material.dart';
import 'package:mazin/Screen/sherdbrefrances/sharedPreferences.dart';
import 'package:mazin/helper/sharedPreferences.dart';

class Listsherd extends StatefulWidget {
   Listsherd({super.key});

  @override
  State<Listsherd> createState() => _ListsherdState();
}

class _ListsherdState extends State<Listsherd> {
  
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  List<String> lis = [];
late String data ="" ;
  Future<void> _loadData() async {
     data = await SharedPreferencesHelper.get('name');
     setState(() {
       
     });
    // if (data != null) {
    //   setState(() {
    //     lis = data;
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("List Sherd Refrances", style: TextStyle(color: Colors.white),),      ),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.indigo.withOpacity(0.2), width: 2),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.indigo.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          width: 300,
          height: 300,
          child:
               Text(data,style: TextStyle(fontSize: 26, color: Colors.indigo),),
              
            
         
        ),
      )
    );
  }
}