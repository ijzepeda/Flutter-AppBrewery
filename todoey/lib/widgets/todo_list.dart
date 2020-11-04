import 'package:flutter/material.dart';
import 'package:todoey/models/todo.dart';
import 'package:todoey/widgets/todo_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TodoList extends StatelessWidget {
  // final List<Todo> listaTodo;
  // TodoList({this.listaTodo});
//   @override
//   _TodoListState createState() => _TodoListState();
// }
//
// class _TodoListState extends State<TodoList> {
  // List<Todo> listaTodo = [
  //   Todo(title: "buy milk"),
  //   Todo(title: "buy egg"),
  //   Todo(title: "buy sushi"),
  // ];

  //create named method or anonymous function for the callback
  @override
  Widget build(BuildContext context) {
    // var provider =Provider.of<TaskData>(context); < Creo que hacer esto es un acopia del provider y no sincronizaria la ifo conlos demas
//provider.listaTodo[index].title,
    return Consumer(
      builder: (BuildContext context, TaskData taskData, Widget child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.todos[index];
            return TodoTile(
              // text: Provider.of<TaskData>(context).listaTodo[index].title,//Usando el consumer, se deja de usar este metodo, y se usa el corto
              text: task.title,
              isChecked: task.isDone,
              deleteCallback: () {
                taskData.deleteTodo(task);
                // taskData.deleteTodoAt(index);
              },
              checkboxCallback: (bool checked) {
                taskData.updateTodo(task);
                // setState(() {
                //   taskData.listaTodo[index].toogleDone();
                // });
              },
            );
          },
          itemCount: taskData.todoCount,
        );
      },
    );
  }
}
/*

    ListView.builder(
      itemBuilder: (context, index) {
        return TodoTile(
          text: Provider.of<TaskData>(context).listaTodo[index].title,
          isChecked: Provider.of<TaskData>(context).listaTodo[index].isDone,
          checkboxCallback: (bool checked) {
            // setState(() {
            //   Provider.of<TaskData>(context).listaTodo[index].toogleDone();
            // });
          },
        );
      },
      itemCount: Provider.of<TaskData>(context).listaTodo.length,
    );
 * */
