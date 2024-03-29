import 'package:flutter/material.dart';
import 'package:flutter_project/util/dialog_box.dart';
import 'package:flutter_project/util/todo_tile.dart';

class HomePage extends StatefulWidget{
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final _controller = TextEditingController();
  //list of todo tasks
  List toDoList= [
    ["Wake-up Earlyg",false],
    ["Do Exercise",false],
  ];
  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1]=!toDoList[index][1];
    });
  }
//save 
void saveNewTask() {
  setState(() {
    toDoList.add([_controller.text,false]);
  });
  Navigator.of(context).pop();
}
  //create new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(controller: _controller,
        onSave: saveNewTask,
        onCancel:() => Navigator.of(context).pop(),
        );
      },
    );
    }
  @override
  Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.pink[200],
    appBar: AppBar(
      title: Text('TO-DO APP'),
      elevation: 0,
    ),
    floatingActionButton: FloatingActionButton(onPressed: createNewTask,
    child: Icon(Icons.add)
    ),
    body: ListView.builder(
      itemCount: toDoList.length,
      itemBuilder: (context, index){
        return ToDoTile(
          taskName: toDoList[index][0],
           taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value,index)
          );
        }
      )
    );
  }
 }