import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/models/questions.dart';

class QuestionProvider extends ChangeNotifier{
  int _currentIndex = 0;
  int _score = 0;

  int get currentIndex => _currentIndex;
  int get score => _score;

  List<QuestionModel> allQuestions = questions;
  QuestionModel get currentQuestion => allQuestions[currentIndex];

  List<Map<String, String>> answeredQuestionList = [];

  void getCurrentQuestion(){
    if (_currentIndex < allQuestions.length - 1){
      _currentIndex++;
    }
    notifyListeners();
  }

  void answeredQuestions(String answer){
    bool correctAnswer = answer == currentQuestion.answers[0];
    if (correctAnswer){
      _score++;
    }

    answeredQuestionList.add({
      "question": currentQuestion.question,
      "correctAnswer": currentQuestion.answers[0],
      "choosenAnswer": answer,
      "isAnswerCorrect": correctAnswer.toString(),
    });
  }
}
