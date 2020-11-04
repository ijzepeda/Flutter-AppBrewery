import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/models/todo.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  // final Function addTodoCallback;
  // AddTaskScreen({this.addTodoCallback});
  TextEditingController controller;
  String newTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(
              // controller: controller,
              onChanged: (newText) {
                newTitle = newText;
              },
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 25.0,
              ),
              cursorColor: Colors.lightBlueAccent,
              textAlign: TextAlign.center,
              autofocus: true,
            ),
            SizedBox(
              height: 10.0,
            ),
            FlatButton(
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                // final todo = Todo(title: newTitle);
                Provider.of<TaskData>(context, listen: false).addTodo(newTitle);
                // addTodoCallback(newTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
