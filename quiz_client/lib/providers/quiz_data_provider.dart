import 'package:flutter/cupertino.dart';

import 'package:quiz_shared/src/model/quiz_name.dart';
class QuizDataProvider extends ChangeNotifier{

  List<QuizName> _quizNames= <QuizName>[];

  List<QuizName> get quizNames => [..._quizNames];

  void addQuiz(String name,int id){
    _quizNames.add(QuizName(name,id));
  }

} 