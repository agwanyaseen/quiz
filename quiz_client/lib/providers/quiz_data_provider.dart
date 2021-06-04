import 'package:flutter/cupertino.dart';

import 'package:quiz_shared/src/model/quiz_name.dart';
class QuizDataProvider extends ChangeNotifier{

  List<QuizName> _quizNames= <QuizName>[];

  List<QuizName> get quizNames => [..._quizNames];

  static  final QuizDataProvider _object = QuizDataProvider._();
  factory QuizDataProvider(){
    return _object;
  }
  QuizDataProvider._();


  void addQuiz(String name,int id){
    addInitialData(name, id);
    notifyListeners();
  }

  void addInitialData(String name, int id) {
    _quizNames.add(QuizName(name,id));
  }
  void removeQuiz(int id){
    final quiz = _quizNames.singleWhere((element) => element.id ==id);
    _quizNames.remove(quiz);
    notifyListeners();
  }

} 