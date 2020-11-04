// import 'package:flutter/material.dart';

class Todo {
  String title;
  bool isDone = false;
  Todo({this.title, this.isDone = false});

  void toogleDone() {
    isDone = !isDone;
  }
}
