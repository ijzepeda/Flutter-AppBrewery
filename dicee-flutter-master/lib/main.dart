import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  //var is generic. is better to specifi
  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1; // 6=(0 - 5)
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //create variable in here everytime is built
//     and it can change everytime is called built
//    leftDiceNumber = 2;

    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice$leftDiceNumber.png'),
              onPressed: () {
                rollDice();
                print("Left button was pressed, now is:$leftDiceNumber");
              },
            ), // una forma mas corta de lomismo
          ),
          Expanded(
            flex: 1, //es como el weight > default 1
            child: FlatButton(
              child: Image(
                image: AssetImage('images/dice$rightDiceNumber.png'),
              ),
              onPressed: () {
                rollDice();
                //update values. change the image. print value to terminal
                print("right Dice pressed with:$rightDiceNumber");
              },
            ),
          ),
        ],
      ),
    );
  }
}
