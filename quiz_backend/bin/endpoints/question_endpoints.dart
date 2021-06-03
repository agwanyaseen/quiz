import 'package:shelf/shelf.dart';
import 'package:quiz_shared/src/model/quiz_question.dart';
import 'package:quiz_shared/src/model/quiz_option.dart';
import 'utils.dart';

Future<Response> getquizQuestionsHandler(Request request, String questionId) async {

  var supaClient = getSupabaseClient();

  var response = await supaClient.from(TableName.quizquestions)
                    .select('${QuizQuestionConstants.id} , ${QuizQuestionConstants.question}')
                    .eq(QuizQuestionConstants.quizId, questionId)
                    .execute();

  if(response.error !=null){
    var errorResponse = {
      'error' : response.error?.message, 
    };
    return ApiResponse.error(errorResponse);
  } 

  
  var quizQuestions = <QuizQuestion>[];

  for(var element in response.data){
    var mapElement = element as Map;
    var questionId = mapElement[QuizQuestionConstants.id] as int;
    var question = mapElement[QuizQuestionConstants.question] as String;
    var quizQuestion = QuizQuestion(id: questionId,question: question,);
    quizQuestions.add(quizQuestion);
  }

  for(var question in quizQuestions)  {
    var optionsResponse = await supaClient.from(TableName.quizoptions)
                          .select('${QuizOptionConstants.id} ,${QuizOptionConstants.option} , ${QuizOptionConstants.isCorrect}')
                          .eq(QuizOptionConstants.questionId, question.id)
                          .execute();
    if(optionsResponse.error!=null){}

   
    for(var questionOption in optionsResponse.data as List){
                question.addOptions(QuizOption(id: (questionOption as Map)[QuizOptionConstants.id] as int, 
                                  option: (questionOption)[QuizOptionConstants.option], 
                                  isCorrect: (questionOption)[QuizOptionConstants.isCorrect]));
    }
 
  } 

  return ApiResponse.ok(quizQuestions);
}