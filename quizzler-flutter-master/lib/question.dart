class Question {
  String questionText;
  bool questionAnswer;

  // Question(this.questionText, this.questionAnswer);
  Question(String q, bool a) {
    // Question({String q, bool a}) {
    questionAnswer = a;
    questionText = q;
  }
}

Question newQuestion = Question('text', true);
