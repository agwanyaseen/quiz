

import 'package:quiz_shared/src/model/quiz_option.dart';

class QuizQuestion {
  int id;
  String question='';
  List<QuizOption> options=<QuizOption>[];
  QuizQuestion({required this.id,required this.question});

  void addOptions(QuizOption option)  {
    options.add(option);
  }
  Map toJson(){
    return {
      'question':question,
      'id':id,
      'options':options,
    };
  }

  QuizQuestion.fromJson(Map response): id= response['id'],
                                      question=response['question'], 
                                      options=(response['options'] as List).map((e) => QuizOption.fromJson(e as Map)).toList();  
}