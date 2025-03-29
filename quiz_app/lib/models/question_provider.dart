import 'package:flutter/material.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/models/questions.dart';

class QuestionProvider extends ChangeNotifier{
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;
  List<QuestionModel> allQuestions = questions;

  QuestionModel get currentQuestion => allQuestions[_currentIndex];
  

  void getCurrentQuestion(){
    if (currentIndex < allQuestions.length-1){
      _currentIndex ++;
    }
    notifyListeners();
  }

  

}