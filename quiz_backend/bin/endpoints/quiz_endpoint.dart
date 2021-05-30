

import 'package:shelf/shelf.dart';
// import 'package:supabase/supabase.dart';

import 'utils.dart';

import 'package:quiz_shared/src/model/quiz_name.dart';


//Samples EndPoints
Response addQuizHandler(Request request)  {
  var quizname = request.url.queryParameters['quizName'] as String;

  if(quizname.contains('%20')){
    quizname = quizname.replaceAll('%20', ' ');
  }
  print('Quiz Name: $quizname');
  
  if(quizname.isEmpty){
    var error = {
      'error':'Quiz Name Cannot Be Empty',
    };
    return ApiResponse.error(error);
  }

  var response = {
    'id':1,
  };
  //Add quiz to supabase database;
  return ApiResponse.ok(response);
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