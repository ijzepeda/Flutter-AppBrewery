import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  // final int age;
  double _bmi = 0;
  CalculatorBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25.0) {
      return "You have higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. good job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}
