// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart'; // I only require foundation, so avoi libraries
import 'package:todoey/models/task_data.dart';
import 'package:todoey/models/todo.dart';
// import 'package:collection/collection.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Todo> _listaTodo = [
    Todo(title: "buy milk"),
    Todo(title: "buy egg"),
    Todo(title: "buy sushi"),
  ];

  int get todoCount {
    return _listaTodo.length;
  }

  UnmodifiableListView<Todo> get todos {
    return UnmodifiableListView(_listaTodo);
  }

  Todo getTodo(int i) {
    return _listaTodo[i];
  }

  void addTodo(String text) {
    print("recibi texto con $text");
    final newTodo = Todo(title: text);
    _listaTodo.add(newTodo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    todo.toogleDone();
    notifyListeners();
  }

  void deleteTodo(Todo todo) {
    _listaTodo.remove(todo); //Primer ocurrencia de este evento! D:
    notifyListeners();
  }

  void deleteTodoAt(int index) {
    _listaTodo.removeAt(index);
    notifyListeners();
  }
}
