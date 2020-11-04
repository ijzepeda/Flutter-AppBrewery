import 'package:flutter/material.dart';

class ButtonScreen extends StatefulWidget {
  final String title;
  final Function onPress;
  final Color color;
  final String screen;
  ButtonScreen(
      {this.onPress, @required this.color, @required this.title, this.screen});

  @override
  _ButtonScreenState createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: widget.color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: widget.onPress != null
              ? widget.onPress
              : () {
                  //Go to login screen.
                  Navigator.pushNamed(context, widget.screen);
                },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            widget.title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
