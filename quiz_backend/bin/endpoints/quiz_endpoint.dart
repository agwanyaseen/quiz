import 'package:shelf/shelf.dart';

import 'utils.dart';

import 'package:quiz_shared/src/model/quiz_name.dart';


//Samples EndPoints
Future<Response> addQuizHandler(Request request) async  {
  var quizname = request.url.queryParameters['quizName'] as String;
  if(quizname.isEmpty){
    var error = {
      'error':'Quiz Name Cannot Be Empty',
    };
    return ApiResponse.error(error);
  }
  if(quizname.contains('%20')){
    quizname = quizname.replaceAll('%20', ' ');
  }
  
  final dbresponse = await getSupabaseClient().from('quiz').insert({
    'name': quizname,
  }).execute();
  
  if(dbresponse.error != null){
    var error = {
      'error':dbresponse.error?.message,
    };
    return ApiResponse.internalServerError(error);
  }
  
  print('Quiz Name: $quizname');
  
  
  var resp = (dbresponse.data as List)[0] as Map; 
  var response = {
    'id':resp['id'] as int,
  };
  //Add quiz to supabase database;
  return ApiResponse.ok(response);
}

Future<Response> retrieveQuiz(Request request) async {
  final dbresponse = await getSupabaseClient().from('quiz').select().execute();

  if(dbresponse.error != null){
    var error = {
      'error':dbresponse.error?.message,
    };
    return ApiResponse.internalServerError(error);
  }
  var quizList = dbresponse.data as List;
  var quizNames = <QuizName>[];
  quizList.forEach((element) { 
    final quiz = element as Map;
    quizNames.add(QuizName.fromJson(quiz));
  });
  return ApiResponse.ok(quizNames);
}

Future<Response> removeQuizHandler(Request request, String id) async {
  final dbresponse = await getSupabaseClient().from('quiz').delete().eq('id', id).execute();

  if(dbresponse.error != null){
    var error = {
      'error':dbresponse.error?.message,
    };
    return ApiResponse.internalServerError(error);
  }
  return ApiResponse.ok(null);


}

