import 'package:flutter/material.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/widgets/todo_list.dart';
import 'package:todoey/widgets/todo_tile.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/models/todo.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
//   @override
//   _TasksScreenState createState() => _TasksScreenState();
// }
//
// class _TasksScreenState extends State<TasksScreen> {
  Widget bottomSheetBuilder(BuildContext context) {
    return Container(
      child: Center(
        child: Text("More details"),
      ),
    );
  }

  void addTodoCallback(String textTodo) {
    // setState(() {
    //   listaTodo.add(Todo(title: textTodo));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTaskScreen()));
          // child: AddTaskScreen(addTodoCallback: addTodoCallback)));
          // addTodo();
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            //better than safearea, as it has pading
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30.0,
                  ),
                  backgroundColor: Colors.white,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Todoey',
                    style: TextStyle(
                      fontSize: 50.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Times New Roman",
                    )),
                Text(
                  '${Provider.of<TaskData>(context).todoCount} tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              // color: Colors.white, < is overriden by decoration, but as a child, it crash
              padding: EdgeInsets.symmetric(horizontal: 20.0),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),

              child: TodoList(
                  // listaTodo: listaTodo,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
