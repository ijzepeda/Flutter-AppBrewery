import 'package:flutter/material.dart';
import 'dart:math';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizbrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  Icon check = Icon(
    Icons.check,
    color: Colors.green,
  );
  Icon cross = Icon(
    Icons.close,
    color: Colors.red,
  );

  List<Widget> scoreKeeper = [];
  bool correctAnswer = false;
  bool accepted = false;

//answers[0];
  void changeQuestion(bool answer) {
    setState(() {
      //dependindo de la posicion de esta verificacion es la conducta de la app. sale el alert despues de contestar, o al repetir la ultima pregunta

      if (quizbrain.isFinished()) {
        //showalert
        Alert(
          context: context,
          // type: AlertType.error,
          title: "Game Over",
          desc: "You have reached the end of questions.",
          buttons: [
            DialogButton(
              child: Text(
                "AGAIN",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(context);
                accepted = true;
              },
              width: 120,
            )
          ],
        ).show();

        if (accepted) {
          scoreKeeper.clear();
          quizbrain.reset();
          accepted = false;
        }
      } else {
        if (quizbrain.getQuestionAnswer() == answer) {
          scoreKeeper.add(check);
        } else {
          scoreKeeper.add(cross);
        }
        correctAnswer = quizbrain.getQuestionAnswer();
        quizbrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizbrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                changeQuestion(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                changeQuestion(false);
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
