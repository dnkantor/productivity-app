import 'package:be_productive/models/global.dart';
import 'package:be_productive/models/widgets/main_todo_widget.dart';
import 'package:flutter/material.dart';
import 'package:be_productive/models/classes/task.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  List<Task> taskList = [];

  @override
  Widget build(BuildContext context) {
    taskList = getList();
    return Container(
      color: darkGreyColor,
      child: Theme (
          data: ThemeData(canvasColor: Colors.transparent),
          child: ReorderableListView(
          padding: EdgeInsets.only(top: 250),
          children: taskList.map((item) => _buildListTile(context, item)).toList(), 
          onReorder: _onReorder,
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, Task item) {
    return ListTile(
      key: Key(item.taskId),
      title: MainTodo(title: item.title),
    ); 
  } 

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final Task item = taskList.removeAt(oldIndex);
      taskList.insert(newIndex, item);
    });
  }

  List<Task> getList() {
    for (int i = 0; i < 50; i++) {
      taskList.add(Task("Task #"+i.toString(), false, i.toString()));
    }
    return taskList;
  }

  // Widget getTodoWidget () {
  //     //TODO

  // }
}