import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  String text;
  bool isChecked = false;
  final Function checkboxCallback;
  final Function deleteCallback;

  TodoTile(
      {this.text, this.isChecked, this.checkboxCallback, this.deleteCallback});

  // void checkBoxCallback(bool newCheckboxValue) {
  // setState(() {
  // isChecked = newCheckboxValue;
  // });
  // } >>>> los callbacks suelen ponerse como funciones anonimas

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback, //Keep the callback
        //(bool value) {
        // isChecked = value;
        // checkboxCallback(value),
        // },
      ),
      onLongPress: deleteCallback,
    );
  }
}
