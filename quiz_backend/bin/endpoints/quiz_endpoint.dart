import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:supabase/supabase.dart';

import 'utils.dart';

import 'package:quiz_shared/src/model/quiz_name.dart';
//Samples EndPoints


Response addQuizHandler(Request request, String name)  {
  print('Quiz Name $name');
  return Response.ok(name);
}

Response retrieveQuiz(Request request)  {
   return ApiResponse.ok(quizNames);
}

List<QuizName> get quizNames => [];//List.generate(10, (index) => QuizName('Quiz Api Response $index:',index));  

// class Metadata  {
  
//   List<QuizName> _quizNames = [];//List.generate(10, (index) => QuizName('Quiz Api Response $index:',index));  
//   List<QuizName> get quizNames => [..._quizNames];//List.generate(10, (index) => QuizName('Quiz Api Response $index:',index));  
//   static final Metadata _metadata=Metadata();
//   factory Metadata.create()=>_metadata;
// }