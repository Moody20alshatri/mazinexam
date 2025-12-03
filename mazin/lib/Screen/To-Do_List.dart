import 'package:flutter/material.dart';
import 'package:mazin/helper/globelList.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('قائمة المهام', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8.0),
                      
                    ),
                    child: ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(
                          decoration: item.isDone ? TextDecoration.lineThrough : null,
                          fontSize: 22,
                          color: item.isDone ? Colors.grey : Colors.black,
                          fontWeight: item.isDone ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      trailing: IconButton(onPressed: (){
                        setState(() {
                          items.removeAt(index);
                        });
                      }, icon: Icon(Icons.delete, color: Colors.red,)),
                      leading: Checkbox(  
                        value: item.isDone,
                        onChanged: (bool? value) {
                          setState(() {
                            item.isDone = value ?? false;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) {
                      setState(() {
                        items.add(ToDoItem(title: value));
                        _controller.clear();
                      });
                      
                    },
                    decoration: const InputDecoration(
                      labelText: 'إضافة مهمة جديدة',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ToDoItem {
  String title;
  bool isDone;

  ToDoItem({required this.title, this.isDone = false});
}